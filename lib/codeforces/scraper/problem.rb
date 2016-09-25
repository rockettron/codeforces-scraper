module Codeforces
  module Scraper
    class Problem
    	ATTRIBUTES = %w{
    		title
    		time_limit
    		memory_limit
    		input_file
    		output_file
    		text
    		input_specification
    		output_specification
    		sample_tests
    		note
    	}    	

    	def initialize(contest_id, problem_id)
    		@contest_id = contest_id
    		@problem_id = problem_id
    		@problem_url = "http://codeforces.com/contest/#{contest_id}/problem/#{problem_id}"
    		@page = http_client.get(@problem_url)
    		@dom = Nokogiri::HTML(@page)
    	end

    	def title
    		@title ||= node_dom.css_at(".header .title").text
    	end

    	def time_limit
    		@time_limit ||= node_dom.css_at(".header .time-limit").text
    	end

    	def memory_limit
    		@memory_limit ||= node_dom.css_at(".header .memory-limit").text
    	end

    	

    	private 

    	def node_dom
    		@dom.css_at(".problem-statement")
    	end

    end
  end
end
