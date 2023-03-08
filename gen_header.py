import re;
import sys
import gettext;

t = gettext.translation(sys.argv[1], localedir="po", languages=sys.argv[2:], fallback=True);

gettext_re = re.compile(r"""
       __gettext__\s* \(        # marker
                        (\w+)\s*, # identifier,
                         \s* "((?:\\.|[^\\"])*)"   # single string
                         \s*
                      \)
 """, re.VERBOSE | re.ASCII)

text = sys.stdin.read()
for m in gettext_re.finditer(text):
    translated = t.gettext(m.group(2))
    print(f'#define {m.group(1)} ("{translated}")')
