# frozen_string_literal: true

require 'test_helper'
require 'tip_tap'

class TipTapTest < ActiveSupport::TestCase

  setup do
    @json = JSON.parse(File.read("test/fixtures/files/tiptap-state.json"))
  end

  test "parses the json and returns the html" do
    SecureRandom.stub(:uuid, 'auto-uuid-999') do
      document = TipTap::Document.from_json(@json)
      assert_equal document.to_html,
                  "<div class=\"content\"><h2 class=\"title is-2\" id=\"auto-uuid-999\" data-toc-id=\"auto-uuid-999\">Site Summary Overview - <em>May 2nd 2023</em></h2><img src=\"https://img.companycam.com/5zVdNKWQ1hqPOD-IspzX3kMsodTPlv6n39kgerOGjc4/rs:fit:4032:4032/q:100/aHR0cHM6Ly9jb21w/YW55Y2FtLXBlbmRp/bmcuczMuYW1hem9u/YXdzLmNvbS82OTc5/YmFlZS03MzU5LTQy/OWYtYmFhYS0yMmVl/NDY1NWZhODUuanBn.jpg\" /><p>This is a site visit summary that is being <strong>synthesized</strong> by <strong><em>Chad Wilken.</em></strong></p><p></p><ul class=\"task-list\"><li class=\"task-item checked\"><p>Todo 1</p></li><li class=\"task-item\"><p><strong>Todo 2</strong></p></li><li class=\"task-item\"><p><strong><em>Todo 3</em></strong></p></li></ul><p></p><h3 class=\"title is-3\" id=\"auto-uuid-999\" data-toc-id=\"auto-uuid-999\">This is a heading 2</h3><h4 class=\"title is-4\" id=\"auto-uuid-999\" data-toc-id=\"auto-uuid-999\">This is a heading 3</h4><p></p><ul><li><p>This is a bullet item</p></li><li><p><strong>This is </strong><em>another item</em></p></li></ul><p>Final paragraph.</p></div>"
    end
  end

  test "parses the json and returns the plain text" do
    document = TipTap::Document.from_json(@json)
    assert_equal document.to_plain_text,
                "Site Summary Overview -  May 2nd 2023  This is a site visit summary that is being synthesized by Chad Wilken.  Todo 1 Todo 2 Todo 3  This is a heading 2 This is a heading 3  This is a bullet item This is another item Final paragraph."
  end

  test "parses the json and serializes it back to json" do
    SecureRandom.stub(:uuid, 'auto-uuid-999') do
      document = TipTap::Document.from_json(@json)
      document_2 = TipTap::Document.from_json(document.to_h)
      assert_equal(document.to_h, document_2.to_h)
    end
  end
end