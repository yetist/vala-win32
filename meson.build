project('vala-win32',
  ['c', 'vala'],
  version : '0.1.0',
)

soversion = 1
libversion = '@0@.@1@.@2@'.format(soversion, 0, 0)

vapi_dir = meson.current_source_dir() / 'vapi'
add_project_arguments(['--vapidir', vapi_dir], language: 'vala')

gee_dep = dependency('gee-0.8')
glib_dep = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')
top_srcdir = include_directories('.')
libwin32_dep = meson.get_compiler('vala').find_library('libwin32', dirs: vapi_dir)

subdir('src')
subdir('res')
subdir('examples')
