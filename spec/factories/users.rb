FactoryGirl.define do
  factory :user do
    username 'factorygirl'
    age 30
    email 'sherkhan@gmail.com'
    password 'abc12345'
    password_confirmation 'abc12345'
    firstname 'Sher'
    lastname 'Khan'
    address 'DHA'
    organization 'LUMS'
    designation 'user'
    phone '090078601'
    cnic '331008112345'
    
  end
  factory :rizq do
    user_id 1234
    action  'Request'
    food  'Yum'
    quantity '12'
    address 'abc12345'
    area 'LUMS'
    date '25-Nov-2011'
    time  '12:50'
    perishable true
  end
end

# FactoryGirl.define do 
  
# end