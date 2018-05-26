class Helper

  def self.current_user(session)
    @user = User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    if session[:user_id] == nil
      false
    else
      true
    end
  end

  def self.get_resources(topic)
    @resources = []
    Resource.all.each do |r|
      if r.topic_id == topic.id
        @resources << r
      end
    end
    @resources
  end

end
