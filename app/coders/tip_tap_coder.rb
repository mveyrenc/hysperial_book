# frozen_string_literal: true

require "tip_tap"

class TipTapCoder
  # include Rendering, Serialization, ContentHelper
  #
  # attr_reader :document
  #
  # delegate :to_h, :to_html, :to_markdown, :to_plain_text, to: :document
  # delegate :blank?, :empty?, :html_safe, :present?, to: :document
  #
  # class << self
  #   def fragment_by_canonicalizing_content(content)
  #     fragment = ActionText::Attachment.fragment_by_canonicalizing_attachments(content)
  #     fragment = ActionText::AttachmentGallery.fragment_by_canonicalizing_attachment_galleries(fragment)
  #     fragment
  #   end
  # end
  #
  # def initialize(content = nil, options = {})
  #   @document = TipTap::Document.from_json(content)
  # end
  #
  # # Extracts links from the HTML fragment:
  # #
  # #     html = '<a href="http://example.com/">Example</a>'
  # #     content = ActionText::Content.new(html)
  # #     content.links # => ["http://example.com/"]
  # def links
  #   @links ||= document.find_all("a[href]").map { |a| a["href"] }.uniq
  # end
  #
  # # Extracts ActionText::Attachment objects from the HTML fragment:
  # #
  # #     attachable = ActiveStorage::Blob.first
  # #     html = %Q(<action-text-attachment sgid="#{attachable.attachable_sgid}" caption="Captioned"></action-text-attachment>)
  # #     content = ActionText::Content.new(html)
  # #     content.attachments # => [#<ActionText::Attachment attachable=#<ActiveStorage::Blob...
  # def attachments
  #   @attachments ||= attachment_nodes.map do |node|
  #     attachment_for_node(node)
  #   end
  # end
  #
  # def attachment_galleries
  #   @attachment_galleries ||= attachment_gallery_nodes.map do |node|
  #     attachment_gallery_for_node(node)
  #   end
  # end
  #
  # def gallery_attachments
  #   @gallery_attachments ||= attachment_galleries.flat_map(&:attachments)
  # end
  #
  # # Extracts ActionText::Attachable objects from the HTML fragment:
  # #
  # #     attachable = ActiveStorage::Blob.first
  # #     html = %Q(<action-text-attachment sgid="#{attachable.attachable_sgid}" caption="Captioned"></action-text-attachment>)
  # #     content = ActionText::Content.new(html)
  # #     content.attachables # => [attachable]
  # def attachables
  #   @attachables ||= attachment_nodes.map do |node|
  #     ActionText::Attachable.from_node(node)
  #   end
  # end
  #
  # def append_attachables(attachables)
  #   attachments = ActionText::Attachment.from_attachables(attachables)
  #   self.class.new([self.to_s.presence, *attachments].compact.join("\n"))
  # end
  #
  # def render_attachments(**options, &block)
  #   content = document.replace(ActionText::Attachment.tag_name) do |node|
  #     if node.key?("content")
  #       sanitized_content = sanitize_content_attachment(node.remove_attribute("content").to_s)
  #       node["content"] = sanitized_content if sanitized_content.present?
  #     end
  #     block.call(attachment_for_node(node, **options))
  #   end
  #   self.class.new(content, canonicalize: false)
  # end
  #
  # def render_attachment_galleries(&block)
  #   content = ActionText::AttachmentGallery.fragment_by_replacing_attachment_gallery_nodes(document) do |node|
  #     block.call(attachment_gallery_for_node(node))
  #   end
  #   self.class.new(content, canonicalize: false)
  # end
  #
  # # Returns a plain-text version of the markup contained by the content, with tags
  # # removed but HTML entities encoded.
  # #
  # #     content = ActionText::Content.new("<h1>Funny times!</h1>")
  # #     content.to_plain_text # => "Funny times!"
  # #
  # #     content = ActionText::Content.new("<div onclick='action()'>safe<script>unsafe</script></div>")
  # #     content.to_plain_text # => "safeunsafe"
  # #
  # # NOTE: that the returned string is not HTML safe and should not be rendered in
  # # browsers without additional sanitization.
  # #
  # #     content = ActionText::Content.new("&lt;script&gt;alert()&lt;/script&gt;")
  # #     content.to_plain_text # => "<script>alert()</script>"
  # #     ActionText::ContentHelper.sanitizer.sanitize(content.to_plain_text) # => ""
  #
  #
  # def as_json(*)
  #   @document
  # end
  #
  # def inspect
  #   "#<#{self.class.name} #{to_html.truncate(25).inspect}>"
  # end
  #
  # def ==(other)
  #   if self.class == other.class
  #     to_html == other.to_html
  #   elsif other.is_a?(self.class)
  #     to_s == other.to_s
  #   end
  # end
  #
  # private
  #
  # def attachment_nodes
  #   @attachment_nodes ||= document.find_all(ActionText::Attachment.tag_name)
  # end
  #
  # def attachment_gallery_nodes
  #   @attachment_gallery_nodes ||= ActionText::AttachmentGallery.find_attachment_gallery_nodes(document)
  # end
  #
  # def attachment_for_node(node, with_full_attributes: true)
  #   attachment = ActionText::Attachment.from_node(node)
  #   with_full_attributes ? attachment.with_full_attributes : attachment
  # end
  #
  # def attachment_gallery_for_node(node)
  #   ActionText::AttachmentGallery.from_node(node)
  # end
end

ActiveSupport.run_load_hooks :tip_tap_content, TipTapCoder
