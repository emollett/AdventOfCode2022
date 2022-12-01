require 'rspec'
require_relative 'spec_helper'
require_relative '../day2/main'

describe Day2::Main do
  let(:input) { File.read('./day2/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 'Enter your result here' }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 'Enter your result here' }

    include_examples 'part2'
  end
end
