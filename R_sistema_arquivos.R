R, ambiente e o sistema de arquivos

O R pode interagir com o sistema de arquivos e o sistema operacional.
Algumas implementações podem ser específicas para cada sistema operacional (SO). 
Por exemplo o diretório de trabalho ("workspace") pode ser definido via menu no Windows. 
Entretando vamos aqui dar preferência a funções que independem do SO. 

Ambiente de trabalho

Informações detalhadas sobre a versão do R e plataforma (sistema operacional) são retornadas pelo objeto abaixo. 
Note que é sempre útil informar a saída deste objeto quando utilizando listas de emails do projeto. 
As saídas retornadas na forma de uma list podem ainda ser úteis para escrever programas/rotinas que dependam destas informações

R.version

_
platform       i686-pc-linux-gnu
arch           i686
os             linux-gnu
system         i686, linux-gnu
status         Patched
major          2
minor          13.0
year           2011
month          05
day            28
svn rev        56008
language       R
version.string R version 2.13.0 Patched (2011-05-28 r56008)

Outros comandos relevantes sobre o sistema e recursos, cuja saída não mostramos aqui incluem:
  
getRversion()  retorna string com a versão do R.
.Platform    retorna ista com detalhes sobre a plataforma onde o R foi compilado, disponibilizando informação para trechos de código dependentes de informações sobre o sistema operacional.
Sys.info()   lista com informações dosbre o sistema e usuário.
.Machine   detalhes sobre atirimética usada, tal como manor e maior representação de números, etc, etc. 

Outro comando útil é SessionInfo() que informa sobre o sistema operacional e locales (linguagem utilizada pelo sistema), a versão do R, pacotes carregados e e também os recursos (pacotes) disponíveis. As saídas das funções mencionadas podem ser usada quando informando/reportando problemas encontrados em aplicações e/ou quando escrevendo funções que possuam funcionalidades e opções que dependam destas informações.

sessionInfo()


Área de trabalho

Ao iniciar o R é aberta ou iniciada uma área de trabalho ("workspace") onde os objetos desta sessão poderão ser gravados. 
A localização "default"desta área de trabalho depende do sistema operacional, permissões etc. 
Por exemplo, no LINUX é o diretório de onde o R foi iniciado. 
No Windows é um diretório onde o R foi instalado.

Nos comandos a seguir mostramos como verificar qual o diretório de trabalho sendo usado, 
guardamos esta informação num objeto, verificamos qual o diretório onde o R foi instalado 
e como mudar o diretório de trabalho.

getwd()

"/home/paulojus/DEST/aulasR/Rnw"

> wdir <- getwd()
> wdir

"/home/paulojus/DEST/aulasR/Rnw"

R.home()

"/usr/local/lib/R"

> setwd(R.home())
> getwd()

"/usr/local/lib/R"

> setwd("/home/paulojus")
> getwd()

"/home/paulojus"

O R automaticamente mantém um diretório temporário para uso em cada sessão e 
dentro deste um arquivo. As funções a seguir mostram como obter o caminho e 
nome do diretório earquivo temporários.

tempdir()

"/tmp/Rtmp2DNOZI"

tempfile()

"/tmp/Rtmp2DNOZI/file42f27b85"



Manipulação de arquivos e diretórios

Há uma diversidade de funções para interagir com o diretórios e arquivos. 
Por exemplo dir() vai listar o conteúdo do diretório, e possui vários argumentos 
para seleção. 
Informações sobre cada elemento do diretório podem ser obtidas com 
file.info()


getwd()

"/home/paulojus"

dir("../")

"lost+found" "misc"       "paulojus"


setwd(R.home())
dir()

[1] "bin"          "COPYING"      "doc"          "etc"          "include"
[6] "lib"          "library"      "modules"      "NEWS"         "NEWS.pdf"
[11] "share"        "SVN-REVISION"

args(dir)

function (path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE,
          recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE)
  NULL

file.info("bin")

size isdir mode               mtime               ctime               atime uid
bin 4096  TRUE  755 2011-05-29 18:30:51 2011-05-29 18:30:51 2011-05-29 19:02:45   0
gid uname grname
bin   0  root   root

file.info("bin")$isdir

TRUE

dir(path = "bin")

[1] "BATCH"         "build"         "check"         "COMPILE"       "config"
[6] "exec"          "f77_f2c"       "INSTALL"       "javareconf"    "libtool"
[11] "LINK"          "mkinstalldirs" "pager"         "pgfsweave"     "R"
[16] "Rcmd"          "Rd2dvi"        "Rdconv"        "Rdiff"         "REMOVE"
[21] "Rprof"         "Rscript"       "rtags"         "Sd2Rd"         "SHLIB"
[26] "Stangle"       "Sweave"

dir(pattern = "COPY")

"COPYING"

dir(path = "doc")

[1] "AUTHORS"          "COPYING"          "COPYING.LIB"      "COPYRIGHTS"
[5] "CRAN_mirrors.csv" "FAQ"              "html"             "KEYWORDS"
[9] "KEYWORDS.db"      "manual"           "NEWS.rds"         "RESOURCES"
[13] "THANKS"

dir(path = "doc", full = TRUE)

[1] "doc/AUTHORS"          "doc/COPYING"          "doc/COPYING.LIB"
[4] "doc/COPYRIGHTS"       "doc/CRAN_mirrors.csv" "doc/FAQ"
[7] "doc/html"             "doc/KEYWORDS"         "doc/KEYWORDS.db"
[10] "doc/manual"           "doc/NEWS.rds"         "doc/RESOURCES"
[13] "doc/THANKS"

É possivel efetuar operações do sistema operacional tais como criar, mover, copiar e remover arquivos e/ou diretórios a partir do R.
> setwd("/home/paulojus")
> file.exists("foo.txt")

TRUE

file.create("foo.txt")

TRUE

file.exists("foo.txt")

TRUE

file.rename("foo.txt", "ap.txt")

TRUE

file.exists("foo.txt")

FALSE

file.exists(c("foo.txt", "ap.txt"))

FALSE  TRUE

file.copy("ap.txt", "foo.txt")

TRUE

file.exists(c("foo.txt", "ap.txt"))

TRUE TRUE

file.remove("ap.txt")

TRUE

file.exists(c("foo.txt", "ap.txt"))

TRUE FALSE
