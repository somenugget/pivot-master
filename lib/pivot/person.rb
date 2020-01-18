module Pivot
  class Person
    attr_reader :email, :first_name, :last_name, :items

    def initialize(email:, first_name:, last_name:)
      @email = email
      @first_name = first_name
      @last_name = last_name
      @items = []
    end

    def add_item(item)
      raise ArgumentError("You can add only instance of #{Pivot::Item}") unless item.is_a? Pivot::Item

      item.assignee = email

      @items << item

      yield if block_given?
    end
  end
end
