module UsersHelper


	def friend_buttons(user)
		case current_user.friendship_status(user)
				when "not_friends"
					link_to "Add Friend", friendships_path(user_id: user.id), method: :post
				when "friends"
					link_to "Remove Friend", friendship_path(current_user.friendship_relation(user)), method: :delete
				when "pending"
					link_to "Cancel Request", friendship_path(current_user.friendship_relation(user)), method: :delete
				when "requested"
					accept = link_to "Accept Request", accept_friendship_path(current_user.friendship_relation(user)), method: :put
					deny = link_to "Deny Request", friendship_path(current_user.friendship_relation(user)), method: :delete
					
					return accept + " " + deny 					
				end		
	end

end
