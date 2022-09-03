DaftarSitusJudiDepositPulsaView = require './daftar-situs-judi-deposit-pulsa-view'
{CompositeDisposable} = require 'atom'

module.exports = DaftarSitusJudiDepositPulsa =
  daftarSitusJudiDepositPulsaView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @daftarSitusJudiDepositPulsaView = new DaftarSitusJudiDepositPulsaView(state.daftarSitusJudiDepositPulsaViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @daftarSitusJudiDepositPulsaView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'daftar-situs-judi-deposit-pulsa:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @daftarSitusJudiDepositPulsaView.destroy()

  serialize: ->
    daftarSitusJudiDepositPulsaViewState: @daftarSitusJudiDepositPulsaView.serialize()

  toggle: ->
    console.log 'DaftarSitusJudiDepositPulsa was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
