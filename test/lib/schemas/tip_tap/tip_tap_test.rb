# frozen_string_literal: true

require 'test_helper'

class TipTapTest < ActiveSupport::TestCase
  setup do
    @json = JSON.parse(File.read('test/fixtures/files/tiptap-state.json'))
  end

  describe 'full integration test' do
    it 'parses the json and returns an non empty document' do
      doc = Schemas::TipTap::Document.from_json(@json)
      assert_not_empty doc
    end

    it 'parses the json and returns the html' do
      expected = File.read('test/fixtures/files/tiptap-state.html')

      SecureRandom.stub(:uuid, 'secure-random-stub') do
        doc = Schemas::TipTap::Document.from_json(@json)
        assert_equal HtmlBeautifier.beautify(expected), HtmlBeautifier.beautify(doc.to_html)
      end
    end

    it 'parses the json and returns the plain text' do
      expected = File.read('test/fixtures/files/tiptap-state.txt')
      doc = Schemas::TipTap::Document.from_json(@json)
      assert_equal expected, doc.to_plain_text
    end

    it 'parses the json and serializes it back to json' do
      doc = Schemas::TipTap::Document.from_json(@json)
      doc2 = Schemas::TipTap::Document.from_json(doc.to_h)
      assert_equal doc.to_h, doc2.to_h
    end
  end
end
