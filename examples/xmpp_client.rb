require 'strophe_ruby'

class XmppClient
  def query_roster(jid, password)
    new_connection(jid, password) {
      current_stage = 1
      @connection.add_handler("iq") do |iq|
        case current_stage
        when 1 
          @connection.send_raw_string("<iq type='get' id='#{Time.now.to_i.to_s}'><query xmlns='jabber:iq:roster'/></iq>")
          current_stage += 1
        else
          StropheRuby::EventLoop.stop(@ctx)
        end
      end
    }
  end

  def create_user(jid, password)
    new_connection(jid, "", false) {
      #create_user is special, it does not wait for an iq reply to send the resgister message
      @connection.add_handler("iq") do |iq|
        StropheRuby::EventLoop.stop(@ctx)
      end
      username = jid.split('@')[0]
      hostname = jid.split('@')[1]
      @connection.send_raw_string("<iq type='set' id='#{Time.now.to_i.to_s}' to='#{hostname}' xmlns='jabber:client'><query xmlns='jabber:iq:register'><username>#{username}</username><password>#{password}</password></query></iq>")
    }
  end
  
private

  def new_connection(jid, password, login_can_not_fail = true)
    lib = StropheRuby::EventLoop.prepare
    @ctx = StropheRuby::Context.new(StropheRuby::Logging::DEBUG)
    @connection = StropheRuby::Connection.new(@ctx)
    @connection.jid = jid
    @connection.password = password
    logged_in = false
    @connection.connect do |status, error, stream_error|
      if !logged_in
        if login_can_not_fail && status != StropheRuby::ConnectionEvents::CONNECT
          #do somthing after login fails
          raise "failed to login: #{error} #{stream_error}"
        else
          yield if block_given?
          logged_in = true
        end
      end
    end

    run_event_loop_until_timeout_or_stopped_by_callback!
  end
 
  #run event loop until timeout or 'StropheRuby::EventLoop.stop' is called inside callback
  def run_event_loop_until_timeout_or_stopped_by_callback!(timeout = 3000)
    raise 'unexpected state' if (@ctx.loop_status != StropheRuby::EventLoop::LOOP_NOTSTARTED)
    @ctx.loop_status = StropheRuby::EventLoop::LOOP_RUNNING
    
    while @ctx.loop_status == StropheRuby::EventLoop::LOOP_RUNNING
      #return if the socket is idle for more than timeout (in millisecond)
      if StropheRuby::EventLoop.run_once(@ctx, timeout) != 0
        @connection.disconnect
        return false
      end
    end

    @connection.disconnect
    return true
  end
end

if $0 == __FILE__
  client = XmppClient.new
  client.create_user("b1@localhost", 'b1')
  #client.query_roster("a1@localhost", 'a1')
end
