# spec/controllers/post_spec.rb
require 'spec_helper'
require 'rails_helper'
Post.validators

describe Post, type: :model do
    it { is_expected.to belong_to(:user)}
end