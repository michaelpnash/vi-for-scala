" ============================================================================
" exec_refactor.vim
"
" File:          vimside#swank#rpc#exec_refactor.vim
" Summary:       Vimside RPC exec-refactor
" Author:        Richard Emberson <richard.n.embersonATgmailDOTcom>
" Last Modified: 2012
"
" ============================================================================
" Intro: {{{1
"
" 
" Execute a refactoring, usually after user confirmation.
"
" Arguments:
"   Int:A procedure id for this refactoring, uniquely generated by client.
"   Symbol:The manner of refacoring we want to prepare. Currently, one of
"     rename, extractMethod, extractLocal, organizeImports, or addImport.
" Return:
"   RefactorResult | RefactorFailure
" 
" Example:
"
" (:swank-rpc (swank:exec-refactor 7 rename) 42)
"
" (:return 
" (:ok 
" (:procedure-id 7 :refactor-type rename
" :touched-files ("SwankProtocol.scala")))
" 42)
"
" ============================================================================

let s:LOG = function("vimside#log#log")
let s:ERROR = function("vimside#log#error")

" public API
function! vimside#swank#rpc#exec_refactor#Run(...)
call s:LOG("exec_refactor TOP") 

  if ! exists("s:Handler")
    let s:Handler = vimside#swank#rpc#util#LoadFuncrefFromOption('swank-rpc-exec-refactor-handler')
    let s:Caller = vimside#swank#rpc#util#LoadFuncrefFromOption('swank-rpc-exec-refactor-caller')
  endif

  let l:args = { }
  let l:rr = vimside#swank#rpc#util#MakeRPCEnds(s:Caller, l:args, s:Handler, a:000)
  call vimside#ensime#swank#dispatch(l:rr)

call s:LOG("exec_refactor BOTTOM") 
endfunction


"======================================================================
" Vimside Callers
"======================================================================

function! g:ExecRefactorCaller(args)
  let cmd = "swank:exec-refactor"

  return '('. cmd .')'
endfunction


"======================================================================
" Vimside Handlers
"======================================================================

function! g:ExecRefactorHandler()

  function! g:ExecRefactorHandler_Abort(code, details, ...)
    call call('vimside#swank#rpc#util#Abort', [a:code, a:details] + a:000)
  endfunction

  function! g:ExecRefactorHandler_Ok(dic, ...)
    let dic = a:dic
call s:LOG("ExecRefactorHandler_Ok dic=".  string(dic)) 

    let l:pid = dic[':pid']

    return 1
  endfunction

  return { 
    \ 'abort': function("g:ExecRefactorHandler_Abort"),
    \ 'ok': function("g:ExecRefactorHandler_Ok") 
    \ }
endfunction
