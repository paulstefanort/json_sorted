require "spec_helper"

require "json"

describe "json_sorted" do
  it "sorts keys in JSON output" do
    hash = {"b" => "bear", "a" => "aardvark", "c" => "cat"}
    unsorted_json = hash.to_json
    expect(unsorted_json).to eq '{"b":"bear","a":"aardvark","c":"cat"}'

    require_relative "../lib/json_sorted"

    sorted_json = hash.to_json
    expect(sorted_json).to eq '{"a":"aardvark","b":"bear","c":"cat"}'
  end
end
