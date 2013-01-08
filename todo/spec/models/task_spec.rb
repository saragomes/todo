require 'spec_helper'

describe Task do
  it { belong_to :user }
  it { belong_to :category }
  it { validate_uniqueness_of :name }
  it { validate_presence_of :name }
  it { validate_presence_of :user }
  it { validate_presence_of :category }
  it { validate_presence_of :date }
  it { validate_presence_of :done }
end
