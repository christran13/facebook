class FriendshipsController < ApplicationController	

	before_action :set_user, only: [:create]
	before_action :set_friendship, only: [:destroy, :accept]

	def accept
		@friendship.accept_friendship
		@friendship.create_activity key: 'friendship.accepted', owner: @friendship.user, recipient: @friendship.friend
		@friendship.create_activity key: 'friendship.accepted', owner: @friendship.friend, recipient: @friendship.user
		respond_to do |format|
			format.html { redirect_to users_path, notice: "Friend Request Accepted"}
		end
	end

	def create
		@friendship = current_user.request_friendship(@user)

		respond_to do |format|
			format.html {redirect_to users_path, notice: "Friend Requested :)"}
		end
	end

	def destroy
		@friendship.destroy

		respond_to do |format|
			format.html { redirect_to users_path, notice: "Friendship Destroyed :("}
		end
	end

	private

	def set_friendship
		@friendship = Friendship.find(params[:id])
	end

	def set_user
		@user = User.find(params[:user_id])
	end


end