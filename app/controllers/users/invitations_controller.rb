class Users::InvitationsController < Devise::InvitationsController
    def new
      super
    end
  
    def create
      super
    end
  
    def edit
      super
      binding.pry
    end

    def show
      super
    end
  
    def update
      super
    end
  
    def destroy
      super
    end
  end