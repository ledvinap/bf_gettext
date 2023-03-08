#pragma once

#include <boost/preprocessor.hpp>

#define STR_ID(c) BOOST_PP_CAT(__trn__, c)

#if GETTEXT_PREPARE
# define _(str) __gettext__(STR_ID(__COUNTER__), str)
#else
# define _(str) GETTEXT( __COUNTER__, str)
#endif


#define GETTEXT(c,str) BOOST_PP_IIF(BOOST_PP_IS_BEGIN_PARENS(STR_ID(c)), BOOST_PP_REMOVE_PARENS(STR_ID(c)), str)
