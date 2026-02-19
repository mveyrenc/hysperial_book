# frozen_string_literal: true

require 'test_helper'

class DomParserTest < ActiveSupport::TestCase
  describe 'paragraph node' do
    it 'parse an empty paragraph' do
      html = '<p></p>'
      fragment = Nokogiri::HTML.fragment(html)
      n = Schemas::TipTap::DomParser.from_dom_node(fragment.children.first)

      assert_equal "<div class=\"content\">#{html}</div>", n.to_html
    end

    it 'parse HTML DOM' do
      html = '<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet. Curabitur accumsan turpis pharetra <strong>augue tincidunt</strong> blandit.</p>'
      fragment = Nokogiri::HTML.fragment(html)
      n = Schemas::TipTap::DomParser.from_dom_node(fragment.children.first)

      assert_equal "<div class=\"content\">#{html}</div>", n.to_html
    end
  end

  describe 'bullet list node' do
    it 'parse an empty list' do
      html = '<ul><li></li></ul>'
      fragment = Nokogiri::HTML.fragment(html)
      n = Schemas::TipTap::DomParser.from_dom_node(fragment.children.first)

      assert_equal "<div class=\"content\">#{html}</div>", n.to_html
    end
    it 'parse HTML DOM' do
      html = '<ul><li>Hello!</li><li><p>Hello you!</p></li><li><ul><li>Hello</li><li>World!</li></ul></li></ul>'
      fragment = Nokogiri::HTML.fragment(html)
      n = Schemas::TipTap::DomParser.from_dom_node(fragment.children.first)

      assert_equal "<div class=\"content\">#{html}</div>", n.to_html
    end
  end

  describe 'parse from string' do
    it 'parse HTML string' do
      html = '<ul><li>Hello!</li><li><p>Hello you!</p></li><li><ul><li>Hello</li><li>World!</li></ul></li></ul>'
      n = Schemas::TipTap::DomParser.from_dom_node(html)
      assert_equal "<div class=\"content\">#{html}</div>", n.to_html
    end

    it 'parse HTML string with marks' do
      html = '<p><strong>Hello!</strong><a>World!</a></p>'
      n = Schemas::TipTap::DomParser.from_dom_node(html)
      expected = { 'type' => 'doc',
                   'content' => [{ 'content' => [{ 'marks' => [{}], 'text' => 'Hello!' },
                                                 { 'marks' => [{}], 'text' => 'World!' }] }] }
      assert_equal "<div class=\"content\">#{html}</div>", n.to_html
      assert_equal expected, n.to_h
    end

    it 'parse empty HTML string' do
      html = ''
      n = Schemas::TipTap::DomParser.from_dom_node(html)
      assert_equal "<div class=\"content\">#{html}</div>", n.to_html
    end

    it 'parse mal-formed HTML string' do
      html = '<ul><p></li>'
      n = Schemas::TipTap::DomParser.from_dom_node(html)
      assert_equal '<div class="content"><ul><p></p></ul></div>', n.to_html
    end

    it 'parse not HTML string' do
      html = 'Hello world!'
      n = Schemas::TipTap::DomParser.from_dom_node(html)
      assert_equal '<div class="content">Hello world!</div>', n.to_html
    end
  end
end
