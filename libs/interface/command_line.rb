require "date"

module Interface
  class CommandLine
    def initialize(args:)
      @runtime_args = args
    end

    def get_runtime_date(default: Date.today)
      puts "@runtime_args = #{@runtime_args}"
      puts "default = #{default}"
      date = default.to_s
      @runtime_args.each do |cl_argument|
        split_params = cl_argument.split("=")
        if split_params.first == "--date" && split_params.length == 2
          date = split_params.last
        end
      end
      Date.parse(date)
    end

    def self.log(string)
      puts string
    end
  end
end
