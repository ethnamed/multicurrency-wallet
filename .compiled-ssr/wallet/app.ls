require! {
    \mobx-react : { observer }
    \mobx : { observable }
    \react
    \./pages.ls
    \whitebox
    \./description.ls
    \./browser/window.ls
    \./copy-message.ls
    \./modal.ls : { modal-control }
    \./get-primary-info.ls
}
# .app872166188
#     overflow-y: scroll
#     @import scheme
#     background: $primary
#     height: 600px
#     position: relative
#     color: white
#     text-align: center
#     max-width: 400px
{ get-container } = whitebox
module.exports = ({ store, reload })->
    return null if not store?
    window <<<< { store }
    current-page =
        pages[store.current.page]
    style =
        background-color: get-primary-info(store).color
    react.create-element 'div', {}, children = 
        description store
        react.create-element 'div', { key: "content", style: style, className: 'app app872166188' }, children = 
            modal-control store
            copy-message store
            current-page { store }