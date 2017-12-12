set(GOPATH "${CMAKE_SOURCE_DIR}")

function(ADD_GO_INSTALLABLE_PROGRAM NAME MAIN_SRC)
  get_filename_component(MAIN_SRC_ABS ${MAIN_SRC} ABSOLUTE)
  add_custom_target(${NAME} ALL)
  add_custom_command(TARGET ${NAME}
                    COMMAND env GOPATH=${GOPATH} go get -v
                    COMMAND env GOPATH=${GOPATH} go build -o "${CMAKE_CURRENT_BINARY_DIR}/${NAME}" ${CMAKE_GO_FLAGS} ${MAIN_SRC}
                    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
                    DEPENDS ${MAIN_SRC_ABS})

  install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/${NAME} DESTINATION "${CMAKE_SOURCE_DIR}/release/${NAME}")
endfunction(ADD_GO_INSTALLABLE_PROGRAM)
