require_relative "study_management_client/version"
require "faraday"
require "zipkin-tracer"

module StudyManagementClient

  def self.get_proposals
		conn = get_connection
		filter(JSON.parse(conn.get('/api/v1/nodes/').body))
	end

	def self.get_proposal(id)
		conn = get_connection
		filter(JSON.parse(conn.get('/api/v1/nodes?filter[id]='+id).body))
	end

	private

	def self.get_connection
		conn = Faraday.new(:url => Rails.application.config.study_url) do |faraday|
			faraday.proxy Rails.application.config.study_url
			faraday.request  :url_encoded
			faraday.response :logger
			faraday.adapter  Faraday.default_adapter
		end
		conn.headers = {'Content-Type' => 'application/vnd.api+json'}
		conn.headers = {'Accept' => 'application/vnd.api+json'}
		conn
	end

	def self.filter(obj)
		obj = obj["data"].reject{|k,v| k["attributes"]["cost-code"].to_s.empty?}
		obj.map { |item| filter_attrs(item) }
 	end

	def self.filter_attrs(h)
		{id: h["id"], name: h["attributes"]["name"], cost_code: h["attributes"]["cost-code"]}
	end
end
