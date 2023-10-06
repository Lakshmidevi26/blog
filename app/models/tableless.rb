class Tableless < ApplicationRecord
    include ActiveModel::Model
    attr_accessor :name
    attr_accessor :mark
end    