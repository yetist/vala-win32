source_c = [
'application-window.c',
'button.c',
'clipboard.c',
'container.c',
'control.c',
'device-context.c',
'edit.c',
'label.c',
'layout.c',
'utilities.c',
'window.c',
'wrappers.c',
]

source_h = [
'application-window.h',
'button.h',
'clipboard.h',
'container.h',
'control.h',
'device-context.h',
'edit.h',
'label.h',
'layout.h',
'utilities.h',
'vala-win32.h',
'window.h',
'wrappers.h',
]

install_headers(source_h, subdir : 'vala-win32')

libvala_win32 = shared_library('vala-win32',
  source_c,
  dependencies: [gee_dep, glib_dep, gobject_dep],
  soversion: soversion,
  version: libversion,
  include_directories: top_srcdir,
  install : true,
  install_dir : get_option('libdir')
  )

libvala_win32_deps = declare_dependency(sources: source_h,
  include_directories: [top_srcdir, include_directories('.')],
  dependencies: [gee_dep, glib_dep, gobject_dep, libwin32_dep],
  link_with: libvala_win32)
