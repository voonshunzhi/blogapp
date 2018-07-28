#The first block set the user id cookies 
Warden::Manager.after_set_user do |user, auth, opts| 
    scope = opts[:scope] 
    auth.cookies.signed["#{scope}.id"] = user.id
end

#This block clear the cookies when the user sign out because without this only session is cleared
Warden::Manager.before_logout do |user, auth, opts| 
    scope = opts[:scope] 
    auth.cookies.signed["#{scope}.id"] = nil
end