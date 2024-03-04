package = "ratOS-common-interface"
version = "scm-1"
source = {
   url = "git://github.com/OperRat-Technologies/common-interface.git"
}
description = {
   summary = "Common interface objects to be used in all our interfaces",
   homepage = "*** please enter a project homepage ***",
   license = "MIT"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
      ciParam = "src/ciParam.lua",
      ciScreen = "src/ciScreen.lua"
   }
}
