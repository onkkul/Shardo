Given /^I follow signup with "([^"]*)"$/ do |provider|
    visit "/auth/#{provider.downcase}"
end


Then /^(?:|I )should see the message, "Welcome (back )?([^!]*)! You have (logged in|signed up) via ([^\.]*)."$/ do |back,name,ls,provider|
  #step %Q{I should see "Welcome #{back}#{name}! You have #{ls} via #{provider}."}
  text = "Welcome #{back}#{name}! You have #{ls} via #{provider}."
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^(?:|I )should see "([^"]*) was successfully updated."$/ do |string|
  textd="#{string} was successfully updated."
  if page.respond_to? :should
    page.should have_content(textd)
  else
    assert page.has_content?(textd)
  end
  
end

Given /^the following user exists:$/ do |user_table|
  user_table.hashes.each do |user|
    User.create!(user)
  end  
end

Given /^the following authorization exists:$/ do |authorization_table|
  authorization_table.hashes.each do |authorization|
    Authorization.create!(authorization)
  end  
end

Given /^the following post exists:$/ do |posts|
  posts.hashes.each do |authorization|
    Post.create!(authorization)
  end  
end
