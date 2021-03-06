# frozen_string_literal: true

require "spreadsheet"

module Decidim
  module TermCustomizer
    module Import
      module Readers
        # Imports any exported XLS file to local objects. It transforms the
        # import data using the parser into the final target objects.
        class XLS < Base
          MIME_TYPE = "application/vnd.ms-excel"

          def read_rows
            book = ::Spreadsheet.open(file)
            sheet = book.worksheet(0)
            sheet.each_with_index do |row, index|
              yield row.to_a, index
            end
          end
        end
      end
    end
  end
end
