module Pivot
  class Tracker
    class << self
      def count(items)
        items.count
      end

      def item_for(items, assignee)
        items_with_minimal_points(items)
          .find { |item| item[:assignee] == assignee }
      end

      def pivoted?(items, assignee)
        assignee_items(items, assignee)
          .any?
      end

      def total_points(items, assignee: nil)
        (assignee ? assignee_items(items, assignee) : items_with_minimal_points(items))
          .sum { |item| item[:points]  }
      end

      def unique_assignees(items)
        items
          .uniq { |item| item[:assignee] }
          .map { |item| item[:assignee] }
      end

      private

      def items_with_minimal_points(items)
        items
          .sort_by { |item| item[:points] }
          .uniq { |item| item[:assignee] }
      end

      def assignee_items(items, assignee)
        items
          .select { |item| item[:assignee] == assignee  }
      end
    end
  end
end
