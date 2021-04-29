module Peek
  module Views
    class Select < View
      # A view to present a collection as a select list.
      #
      # name               - Name inserted into the select element's name
      # collection         - A collection of labels and values
      # selected           - A lambda returning the currently selected value
      # onchange           - JavaScript for the select list onchange attribute
      #
      # Returns Peek::Views::Select
      def parse_options
        @name = @options.fetch(:name, "select")
        @collection = @options.fetch(:collection, [])
        @selected = @options.delete(:selected)
        @onchange = @options.delete(:onchange)
      end

      def name
        "peek-select-#{@name}"
      end

      def collection
        if @collection.respond_to?(:call)
          @collection.call
        else
          @collection
        end
      end

      def selected(controller)
        if @selected.respond_to?(:call)
          @selected.call(controller)
        end
      end

      attr_reader :onchange
    end
  end
end
