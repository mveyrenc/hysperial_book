import {AnyExtension, Extension} from "@tiptap/core";
import {Dropcursor, DropcursorOptions} from "@tiptap/extension-dropcursor";
import {Gapcursor} from "@tiptap/extension-gapcursor";
import {History, HistoryOptions} from "@tiptap/extension-history";
import {Bold, BoldOptions} from "../../marks/bold";
import {Code, CodeOptions} from "../../marks/code";
import {Highlight, HighlightOptions} from "../../marks/highlight";
import {Italic, ItalicOptions} from "../../marks/italic";
import {Link, LinkOptions} from "../../marks/link";
import {Strike, StrikeOptions} from "../../marks/strike";
import {Subscript, SubscriptOptions} from "../../marks/sub";
import {Superscript, SuperscriptOptions} from "../../marks/sup";
import {Underline, UnderlineOptions} from "../../marks/underline";
import {Audio, AudioOptions} from "../../nodes/audio";
import {Blockquote, BlockquoteOptions} from "../../nodes/blockquote";
import {BulletList, BulletListOptions} from "../../nodes/bullet-list";
import {CodeBlock, CodeBlockOptions} from "../../nodes/code-block";
import {Details, DetailsOptions} from "../../nodes/details";
import {DetailsContent, DetailsContentOptions} from "../../nodes/details-content";
import {DetailsSummary, DetailsSummaryOptions} from "../../nodes/details-summary";
import {Document} from "../../nodes/document";
import {Embed, EmbedOptions} from "../../nodes/embed";
import {Emoji, EmojiOptions} from "../../nodes/emoji";
import {HardBreak, HardBreakOptions} from "../../nodes/hard-break";
import {Heading, HeadingOptions} from "../../nodes/heading";
import {HorizontalRule, HorizontalRuleOptions} from "../../nodes/horizontal-rule";
import {Image, ImageOptions} from "../../nodes/image";
import {ListItem, ListItemOptions} from "../../nodes/list-item";
import {MathBlock, MathBlockOptions} from "../../nodes/math-block";
import {MathInline, MathInlineOptions} from "../../nodes/math-inline";
import {Mermaid, MermaidOptions} from "../../nodes/mermaid";
import {OrderedList, OrderedListOptions} from "../../nodes/ordered-list";
import {Paragraph, ParagraphOptions} from "../../nodes/paragraph";
import {Plantuml, PlantumlOptions} from "../../nodes/plantuml";
import {Table, TableOptions} from "../../nodes/table";
import {TableCell, TableCellOptions} from "../../nodes/table-cell";
import {TableHeader, TableHeaderOptions} from "../../nodes/table-header";
import {TableRow, TableRowOptions} from "../../nodes/table-row";
import {TaskItem, TaskItemOptions} from "../../nodes/task-item";
import {TaskList, TaskListOptions} from "../../nodes/task-list";
import {Text} from "../../nodes/text";
import {Video, VideoOptions} from "../../nodes/video";
import {configure} from "../../utils/functions";
import {BlockMenu, BlockMenuOptions} from "../../extensions/block-menu/menu";
import {ClickMenu, ClickMenuOptions} from "../../extensions/click-menu/menu";
import {Clipboard, ClipboardOptions} from "../../extensions/clipboard";
import {FloatMenu, FloatMenuOptions} from "../../extensions/float-menu/menu";
import {Markdown, MarkdownOptions} from "../../extensions/markdown";
import {Uploader, UploaderOptions} from "../../extensions/uploader";

export interface LightKitOptions {
    // marks
    sub?: Partial<SubscriptOptions> | boolean;
    sup?: Partial<SuperscriptOptions> | boolean;
    bold?: Partial<BoldOptions> | boolean;
    code?: Partial<CodeOptions> | boolean;
    link?: Partial<LinkOptions> | boolean;
    italic?: Partial<ItalicOptions> | boolean;
    strike?: Partial<StrikeOptions> | boolean;
    highlight?: Partial<HighlightOptions> | boolean;
    underline?: Partial<UnderlineOptions> | boolean;
    // nodes
    text?: boolean;
    document?: boolean;
    paragraph?: Partial<ParagraphOptions> | boolean;
    // extensions
    markdown?: Partial<MarkdownOptions> | boolean;
    clipboard?: Partial<ClipboardOptions> | boolean;
    blockMenu?: Partial<BlockMenuOptions> | boolean;
    floatMenu?: Partial<FloatMenuOptions> | boolean;
    clickMenu?: Partial<ClickMenuOptions> | boolean;
    // tiptap
    history?: Partial<HistoryOptions> | boolean;
    gapCursor?: Partial<any> | boolean;
    dropCursor?: Partial<DropcursorOptions> | boolean;
}

export const LightKit = Extension.create<LightKitOptions>({
    name: "lightKit",
    addExtensions() {
        const extensions: Array<AnyExtension> = [];

        // marks
        configure(extensions, Subscript, this.options.sub);
        configure(extensions, Superscript, this.options.sup);
        configure(extensions, Bold, this.options.bold);
        configure(extensions, Code, this.options.code);
        configure(extensions, Link, this.options.link);
        configure(extensions, Italic, this.options.italic);
        configure(extensions, Strike, this.options.strike);
        configure(extensions, Highlight, this.options.highlight);
        configure(extensions, Underline, this.options.underline);
        // nodes
        configure(extensions, Text, this.options.text);
        configure(extensions, Document, this.options.document);
        configure(extensions, Paragraph, this.options.paragraph);
        // extensions
        configure(extensions, Markdown, this.options.markdown);
        configure(extensions, Clipboard, this.options.clipboard);
        configure(extensions, BlockMenu, this.options.blockMenu);
        configure(extensions, FloatMenu, this.options.floatMenu);
        configure(extensions, ClickMenu, this.options.clickMenu);
        // tiptap
        configure(extensions, History, this.options.history);
        configure(extensions, Gapcursor, this.options.gapCursor);
        configure(extensions, Dropcursor, this.options.dropCursor, {
            color: "var(--tiptap-primary-background)",
            width: 2
        });

        return extensions;
    },
});
