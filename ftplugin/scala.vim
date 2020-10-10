" I've got metals-vim installed, but something is wrong.
" Reported this issue: https://github.com/scalameta/metals/issues/2132
"
" .metals/metals.log
" 2020.10.09 12:41:07 INFO  started: Metals version 0.9.4 in workspace '/home/jeremys/git/spark' for client vim-lsp.
" 2020.10.09 12:41:07 INFO  time: initialize in 0.34s
" 2020.10.09 12:41:09 INFO  no build target: using presentation compiler with only scala-library
" 2020.10.09 12:41:09 WARN  no build target for: /home/jeremys/git/spark/project/SparkBuild.scala
" org.eclipse.lsp4j.jsonrpc.ResponseErrorException: Method not found
"        at org.eclipse.lsp4j.jsonrpc.RemoteEndpoint.handleResponse(RemoteEndpoint.java:209)
"        at org.eclipse.lsp4j.jsonrpc.RemoteEndpoint.consume(RemoteEndpoint.java:193)
"        at org.eclipse.lsp4j.jsonrpc.json.StreamMessageProducer.handleMessage(StreamMessageProducer.java:194)
"        at org.eclipse.lsp4j.jsonrpc.json.StreamMessageProducer.listen(StreamMessageProducer.java:94)
"        at org.eclipse.lsp4j.jsonrpc.json.ConcurrentMessageProcessor.run(ConcurrentMessageProcessor.java:113)
"        at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)
"        at java.util.concurrent.FutureTask.run(FutureTask.java:266)
"        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
"        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
"        at java.lang.Thread.run(Thread.java:748)
"
"2020.10.09 12:42:05 WARN  code navigation does not work for the file '/home/jeremys/git/spark/project/SparkBuild.scala' because it doesn't belong to a build target.

if executable('metals-vim')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'metals',
      \ 'cmd': {server_info->['metals-vim']},
      \ 'initialization_options': { 'rootPatterns': 'build.sbt' },
      \ 'whitelist': [ 'scala', 'sbt' ],
      \ })
endif

nnoremap <buffer> <silent> <C-]> :LspDefinition<cr>
setlocal keywordprg=:LspHover

" This command binding doesn't seem to do anything.  Nothing happens in vim
" nothing seen in .metals/metals.log.
command LspMetalsBuildImport call lsp#send_request('metals', { 'method': 'workspace/executeCommand', 'params': { 'command': 'build-import' }})
