require 'spec_helper'

describe User do
    let :user do
        build :user
    end
    subject do
        user
    end
    context 'is invalid' do
        it 'when required #email is not given' do
            user.email = ''
            should_not be_valid
        end

        it 'when required #password is not given' do
            user.password = ''
            user.password_confirmation = ''
            should_not be_valid
        end
        
        it 'when required #password is less than 5 characters' do
            user.password = 'abc1'
            user.password_confirmation = 'abc1'
            should_not be_valid
        end
        
        it 'when required #firstname is not given' do
            user.firstname = ''
            should_not be_valid
        end
        
        it 'when required #lastname is not given' do
            user.lastname = ''
            should_not be_valid
        end
        
        it 'when #email is not unique' do
            user.save
            user1 = build :user
            user1.save
            user1.should_not be_valid
        end
        
        it 'when #email format is not valid' do
            user.email = 'not a valid mail'
            should_not be_valid
        end
        
        it 'when #email is more than 100 characters' do
            user.email = 'qwertyuioigfdsdfghjkjhgfdsasfdsasdfghjjhgfdsdfghjkjhgfdsdfghjkjhgfdsdfghjkkjhgfdfghjkjhgfdsdfghjklkhgfd'
            should_not be_valid
        end
            
        it 'is valid' do
            expect(user).to be_valid
        end    
    end
end