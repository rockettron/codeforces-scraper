module Codeforces
  module Scraper
    class Problem
    	ATTRIBUTES = %w{
    		title
    		time_limit
    		memory_limit
    		input_file
    		output_file
    		statement
    		input_specification
    		output_specification
    		note
    	}    	

    	def initialize(contest_id, problem_id)
    		@contest_id = contest_id
    		@problem_id = problem_id
    		@problem_url = "http://codeforces.com/contest/#{contest_id}/problem/#{problem_id}"
    		@dom = Nokogiri::HTML(open(@problem_url))
    	end

    	def title
    		@title ||= node_dom.at_css(".header .title").text
    	end

    	def time_limit
    		@time_limit ||= node_dom.at_css(".header .time-limit").children.last.text	
    	end

    	def memory_limit
    		@memory_limit ||= node_dom.at_css(".header .memory-limit").children.last.text
    	end

    	def input_file
    		@input_file ||= node_dom.at_css(".header .input-file").children.last.text
    	end

    	def output_file
    		@output_file ||= node_dom.at_css(".header .output-file").children.last.text
    	end

    	def statement
    		@statement ||= node_dom.css("div p").map(&:to_html).join
    	end

    	def input_specification
    		@input_specification ||= node_dom.css(".input-specification p").map(&:to_html).join
    	end

    	def output_specification
    		@outnput_specification ||= node_dom.css(".output-specification p").map(&:to_html).join
    	end

    	def note 
    		@note ||= node_dom.css(".note p").map(&:to_html).join
    	end

    	def to_json
    		ATTRIBUTES.reduce({}) { |hash, attr| hash[attr.to_sym] = self.send(attr.to_sym); hash }.to_json
    	end

    	private 

    	def node_dom
    		@dom.at_css(".problem-statement")
    	end

    end
  end
end
