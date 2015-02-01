HighlightLineView = require './highlight-line-view'

module.exports =
  config:
    enableBackgroundColor:
      type: 'boolean'
      default: true
    hideHighlightOnSelect:
      type: 'boolean'
      default: false
    enableUnderline:
      type: 'boolean'
      default: false
    enableSelectionBorder:
      type: 'boolean'
      default: false
    underline:
      type: 'string'
      default: 'solid'
      enum: ['solid', 'dotted', 'dashed']
  line: null

  activate: ->
    @line = new HighlightLineView()
    @line.attach()

    atom.commands.add 'atom-text-editor',
      'highlight-line:toggle-background', (event) =>
        @toggleHighlight()
    atom.commands.add 'atom-text-editor',
      'highlight-line:toggle-hide-highlight-on-select', (event) =>
        @toggleHideHighlightOnSelect()
    atom.commands.add 'atom-text-editor',
      'highlight-line:toggle-underline', (event) =>
        @toggleUnderline()
    atom.commands.add 'atom-text-editor',
      'highlight-line:toggle-selection-borders', (event) =>
        @toggleSelectionBorders()

  deactivate: ->
    @line.destroy()

  toggleHighlight: ->
    current = atom.config.get('highlight-line.enableBackgroundColor')
    atom.config.set('highlight-line.enableBackgroundColor', not current)

  toggleHideHighlightOnSelect: ->
    current = atom.config.get('highlight-line.hideHighlightOnSelect')
    atom.config.set('highlight-line.hideHighlightOnSelect', not current)

  toggleUnderline: ->
    current = atom.config.get('highlight-line.enableUnderline')
    atom.config.set('highlight-line.enableUnderline', not current)

  toggleSelectionBorders: ->
    current = atom.config.get('highlight-line.enableSelectionBorder')
    atom.config.set('highlight-line.enableSelectionBorder', not current)
