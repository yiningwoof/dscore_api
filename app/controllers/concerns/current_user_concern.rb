module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    if session[:user_id] 
      @current_user = User.find(session[:user_id])
      if session[:game]
        @current_game = Game.find(session[:game][:game_id])
        # if session[:rounds]
        #   @current_rounds = session[:rounds]
        #   # round_ids = session[:rounds].map{|round| round.id}
        #   # @current_rounds = round_ids.map{|round_id| Round.find(round_id) }
        # end
      end
    end
  end

end