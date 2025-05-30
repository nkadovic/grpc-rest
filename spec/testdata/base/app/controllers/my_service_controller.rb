# frozen_string_literal: true

####### THIS FILE IS AUTOMATICALLY GENERATED BY protoc-gen-rails. DO NOT MODIFY. #######

require 'grpc_rest'
class MyServiceController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from StandardError do |e|
    render json: GrpcRest.error_msg(e), status: :internal_server_error
  end
  rescue_from GRPC::BadStatus do |e|
    render json: GrpcRest.error_msg(e), status: GrpcRest.grpc_http_status(e.code)
  end
  rescue_from ActionDispatch::Http::Parameters::ParseError, Google::Protobuf::TypeError do |e|
    render json: GrpcRest.error_msg(e), status: :bad_request
  end

  METHOD_PARAM_MAP = {

    'test' => [
      { name: 'foobar', val: 'blah/*', split_name: ['foobar'] }
    ],

    'test_2' => [],

    'test_3' => [
      { name: 'sub_record.sub_id', val: nil, split_name: %w[sub_record sub_id] }
    ],

    'test_4' => []
  }.freeze

  def test
    fields = Testdata::TestRequest.descriptor.to_a.map(&:name)
    parameters = request.parameters.to_h.deep_transform_keys(&:underscore)
    grpc_request = GrpcRest.init_request(Testdata::TestRequest, parameters.slice(*fields))
    GrpcRest.assign_params(grpc_request, METHOD_PARAM_MAP['test'], '', request.parameters)
    render json: GrpcRest.send_request('Testdata::MyService', 'test', grpc_request, { emit_defaults: true })
  end

  def test_2
    fields = Testdata::TestRequest.descriptor.to_a.map(&:name)
    parameters = request.parameters.to_h.deep_transform_keys(&:underscore)
    grpc_request = GrpcRest.init_request(Testdata::TestRequest, parameters.slice(*fields))
    GrpcRest.assign_params(grpc_request, METHOD_PARAM_MAP['test_2'], 'second_record', request.parameters)
    render json: GrpcRest.send_request('Testdata::MyService', 'test_2', grpc_request, {})
  end

  def test_3
    fields = Testdata::TestRequest.descriptor.to_a.map(&:name)
    parameters = request.parameters.to_h.deep_transform_keys(&:underscore)
    grpc_request = GrpcRest.init_request(Testdata::TestRequest, parameters.slice(*fields))
    GrpcRest.assign_params(grpc_request, METHOD_PARAM_MAP['test_3'], '', request.parameters)
    render json: GrpcRest.send_request('Testdata::MyService', 'test_3', grpc_request, {})
  end

  def test_4
    fields = Testdata::TestRequest.descriptor.to_a.map(&:name)
    parameters = request.parameters.to_h.deep_transform_keys(&:underscore)
    grpc_request = GrpcRest.init_request(Testdata::TestRequest, parameters.slice(*fields))
    GrpcRest.assign_params(grpc_request, METHOD_PARAM_MAP['test_4'], '*', request.parameters)
    render json: GrpcRest.send_request('Testdata::MyService', 'test_4', grpc_request, {})
  end
end
