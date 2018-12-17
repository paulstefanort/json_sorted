require "spec_helper"

require "set"
require "json"

original_string_json = String.instance_method(:to_json)
original_time_json = Time.instance_method(:to_json)

describe "json_sorted" do
  it "sorts hash keys in JSON output" do
    hash = {"b" => "bear", "a" => "aardvark", "c" => "cat"}
    unsorted_json = hash.to_json
    expect(unsorted_json).to eq '{"b":"bear","a":"aardvark","c":"cat"}'

    require_relative "../lib/json_sorted"

    sorted_json = hash.to_json
    expect(sorted_json).to eq '{"a":"aardvark","b":"bear","c":"cat"}'
  end

  it "sorts array values in JSON output" do
    array = ["b", "a", "c"]
    sorted_json = array.to_json
    expect(sorted_json).to eq '["a","b","c"]'
  end

  it "sorts Set values in JSON output" do
    unsorted_set = Set["b", "a", "c"]
    unsorted_set_json = unsorted_set.to_json

    sorted_set = SortedSet["c", "a", "b"]
    sorted_set_json = sorted_set.to_json

    expect(unsorted_set_json).to eq sorted_set_json
    expect(sorted_set_json).to eq '["a","b","c"]'
  end

  it "updates the implementation of String#to_json" do
    string = "sample-string"
    expect(string.to_json).to eq '"sample-string"'

    expect(String.instance_method(:to_json)).to_not eq original_string_json
  end

  it "updates the implementation of Time#to_json" do
    time = Time.now
    expect(time.to_json).to eq "\"#{time.to_s}\""

    expect(Time.instance_method(:to_json)).to_not eq original_time_json
  end
end
