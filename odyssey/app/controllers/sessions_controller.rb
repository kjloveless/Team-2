class SessionsController < ApplicationController
  # Logging out is only allowed if the user is actually logged in
  before_action :logged_in, only: [:destroy]
  
  def new
  end
  
  # Create will log the user in, or display a message if the login attempt
  #  is unsuccessful.
  def create
    # Find the user by their user ID
    user = User.find_by(user_id: params[:session][:user_id])
    # TODO: Will need to actually authenticate the user, once the Users
    #  controller is finished.
    #if user && user.authenticate(params[:session][:password])
    
    # If the user exists, send them to the home1 page
    if user
      # Store the user_id in the session
      log_in user
      redirect_to '/home/home1'
    else
      # Otherwise, keep them on the login page.
      flash.now[:danger] = 'Invalid user ID/password combination'
      render 'new'
    end
  end
  
  # This is the log-out function. Will log the user out of the session,
  #  and send them to the homepage.
  def destroy
    # Log the user out of the session
    log_out
    # Display the following message when the user has been redirected
    flash[:success] = "You have successfully been logged out."
    # Redirect the user to the login page, thus completing the logout process
    redirect_to '/login'
  end
end
