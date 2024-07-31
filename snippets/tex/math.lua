local ls = require("luasnip")
local f = ls.function_node
local d = ls.dynamic_node
local r = ls.restore_node

-- Auxiliary functions

-- Math zone context
-- taken from https://ejmastnak.com/

local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- Visual placeholder
-- taken from https://ejmastnak.com/

local get_visual = function(args, parent, default_text)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1,parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1,default_text))
  end
end

local function v(pos, default_text)
  return d(pos, function(args, parent) return get_visual(args, parent, default_text) end)
end

-- Matrices and cases
-- taken from github.com/evesdropper

local generate_matrix = function(args, snip)
	local rows = tonumber(snip.captures[2])
	local cols = tonumber(snip.captures[3])
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
		ins_indx = ins_indx + 1
		for k = 2, cols do
			table.insert(nodes, t(" & "))
			table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
			ins_indx = ins_indx + 1
		end
		table.insert(nodes, t({ " \\\\", "" }))
	end
	nodes[#nodes] = t(" \\\\")
	return sn(nil, nodes)
end

local generate_hom_matrix = function(args, snip)
	local rows = tonumber(snip.captures[2])
	local cols = tonumber(snip.captures[3])
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		if j == 1 then
			table.insert(nodes, r(ins_indx,i(1)))
			table.insert(nodes, t("_{11}"))
		else
			table.insert(nodes, rep(1))
			table.insert(nodes, t("_{" .. tostring(j) .. "1}"))
		end
		ins_indx = ins_indx + 1
		for k = 2, cols do
			table.insert(nodes, t(" & "))
			table.insert(nodes, rep(1))
			table.insert(nodes, t("_{" .. tostring(j) .. tostring(k) .. "}"))
			ins_indx = ins_indx + 1
		end
		table.insert(nodes, t({ " \\\\", "" }))
	end
	nodes[#nodes] = t(" \\\\")
	return sn(nil, nodes)
end

local generate_cases = function(args, snip)
	local rows = tonumber(snip.captures[1]) or 2 
	local cols = 2
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		table.insert(nodes, r(ins_indx, tostring(j) .. "x1", sn(1,{t("    \\hfil "),i(1)})))
		ins_indx = ins_indx + 1
		for k = 2, cols do
			table.insert(nodes, t(" & "))
			table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
			ins_indx = ins_indx + 1
		end
		table.insert(nodes, t({ " \\\\", "" }))
	end
    table.remove(nodes, #nodes)
	return sn(nil, nodes)
end

-- Snippets

return {

-- Math

-- Math alphabet identifiers

s({trig = "([^%a])mc", name = "Calligraphic math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathcal{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mr", name = "Roman math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathrm{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mb", name = "Bold math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathbf{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ms", name = "Sans serif math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathsf{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mt", name = "Typewriter math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathtt{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mn", name = "Normal math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathnormal{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mi", name = "Italic math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathit{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mf", name = "Euler Fraktur math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathfrak{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ma", name = "Blackboard bold math font", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathbb{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

-- Display environments and alignment structures

s({trig = "([^%a])mm", name = "Inline display", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("$"), d(1,get_visual), t("$")
    }
),

s({trig = "en", name = "Generic environment"},
    {
		t("\\begin{"), i(1,"env"), t("}"),
		t({"",""}), t("    "), d(2,get_visual),
		t({"",""}), t("\\end{"), rep(1), t("}")
    }
),

s({trig = "nn", name = "New equation"},
    {
        c(1,
            {
                {
                    t("\\begin{equation}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{equation}")
                },
                {
                    t("\\begin{equation*}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{equation*}")
                }
            }
        )
    }
),

s({trig = "ml", name = "New multline"},
    {
        c(1,
            {
                {
                    t("\\begin{multline}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{multline}")
                },
                {
                    t("\\begin{multline*}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{multline*}")
                }
            }
        )
    }
),

s({trig = "gap", name = "Multline gap"},
    {
        t("\\setlenght\\multlinegap{0pt}")
    }
),

s({trig = "sp", name = "New split"},
    {
		t("\\begin{split}"),
		t({"",""}), t("    "), d(1,get_visual),
		t({"",""}), t("\\end{split}")
    }
),

s({trig = "gg", name = "New gather"},
    {
        c(1,
            {
                {
                    t("\\begin{gather}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{gather}")
                },
                {
                    t("\\begin{gather*}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{gather*}")
                }
            }
        )
    }
),

s({trig = "aa", name = "New align"},
    {
        c(1,
            {
                {
                    t("\\begin{align*}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{align*}")
                },
                {
                    t("\\begin{align}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{align}")
                }
            }
        )
    }
),

s({trig = "fal", name = "New falign"},
    {
        c(1,
            {
                {
                    t("\\begin{falign}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{falign}")
                },
                {
                    t("\\begin{falign*}"),
					t({"",""}), t("    "), d(1,get_visual),
					t({"",""}), t("\\end{falign*}")
                }
            }
        )
    }
),

s({trig = "(%d?)cs", name = "New cases environment", snippetType = "autosnippet", regTrig = true, wordTrig = false},
	{
        t("\\begin{cases}"),
		t({"",""}), d(1,generate_cases),
		t({"",""}), t("\\end{cases}")
	},
    {condition = in_mathzone}
),

s({trig = "([^%a])br", name = "Display line break", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\\\"),
		t({"",""}), i(1)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itr", name = "Short text between lines", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\intertext{"), v(1,"text"), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])tx", name = "Text inside display", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\text{"), v(1,"text"), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])dib", name = "Display page break", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\displaybreak")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])dis", name = "Displaystyle", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\displaystyle")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ty", name = "Textstyle", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\textstyle")
    },
    {condition = in_mathzone}
),

-- Equation numbering and tags

s({trig = "([^%a])ntg", name = "Suppress equation tag", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\notag")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])tag", name = "Equation tag", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\tag{"), v(1,"tag"), t("}")
                },
                {
                    t("\\tag*{"), v(1,"tag"), t("}")
                }
            }
        )
    }
),

s({trig = "([^%a])teq", name = "Last number equation", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\theequation")
    },
    {condition = in_mathzone}
),

-- Matrix-like environments

s({trig = "([bBpvV])(%d+)x(%d+)", name = "New matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		t("\\begin{"), f(function(_, snip) return snip.captures[1] .. "matrix" end), t("}"),
		t({"",""}), d(1,generate_matrix),
		t({"",""}), t("\\end{"), f(function(_, snip) return snip.captures[1] .. "matrix" end), t("}")
    },
    {condition = in_mathzone}
),


s({trig = "([bBpvV])(%d+),(%d+)", name = "New homogeneous matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		t("\\begin{"), f(function(_, snip) return snip.captures[1] .. "matrix" end), t("}"),
		t({"",""}), d(1,generate_hom_matrix),
		t({"",""}), t("\\end{"), f(function(_, snip) return snip.captures[1] .. "matrix" end), t("}")
    },
    {condition = in_mathzone}
),


s({trig = "([bBpvV])gn", name = "New generic matrix", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
        t("\\begin{"), f(function(_, snip) return snip.captures[1] .. "matrix" end), t("}"),
		t({"",""}), t("    "), i(1), t("_{11} & "), rep(1), t("_{12} & \\cdots & "), rep(1), t("_{1"), i(2), t("}"), t(" \\\\"),
		t({"",""}), t("    "), rep(1), t("_{21} & "), rep(1), t("_{22} & \\cdots & "), rep(1), t("_{2"), rep(2), t("}"), t(" \\\\"),
		t({"",""}), t("    "), t("\\vdots & \\vdots & \\ddots & \\vdots \\\\"),
		t({"",""}), t("    "), rep(1), t("_{"), i(3), t("1} & "), rep(1), t("_{"), rep(3), t("2} & \\cdots & "), rep(1), t("_{"), rep(3), rep(2), t("} \\\\"),
		t({"",""}), t("\\end{"), f(function(_, snip) return snip.captures[1] .. "matrix" end), t("}")
    },
    {condition = in_mathzone}
),

-- Subscripts and superscripts

s({trig = ";", name = "Short subscript", snippetType = "autosnippet", wordTrig = false},
    {
        t("_")
    },
    {condition = in_mathzone}
),

s({trig = ":", name = "Subscript", snippetType = "autosnippet", wordTrig = false},
    {
        t("_{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "´", name = "Short superscript", snippetType = "autosnippet", wordTrig = false},
    {
        t("^")
    },
    {condition = in_mathzone}
),

s({trig = "¨", name = "Superscript", snippetType = "autosnippet", wordTrig = false},
    {
        t("^{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "¨", name = "Superscript", snippetType = "autosnippet", wordTrig = false},
    {
        t("^{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "'", name = "Subscript and superscript", snippetType = "autosnippet", wordTrig = false},
    {
		t("_{"), i(1), t("}^{"), i(2), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])st", name = "Stacking", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\substack{"), v(1,"..."), t(" \\\\ "), i(2,"..."), t("}")
    },
    {condition = in_mathzone}
),

-- Compound structures

s({trig = "([^%a])ltx", name = "Left relation arrow", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
        			t("\\xleftarrow{"), i(1,"top"), t("}")
		        },
		        {
        			t("\\xleftarrow["), i(1,"bottom"), t("]{"), i(2,"top"), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])rtx", name = "Left relation arrow", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
        			t("\\xrightarrow{"), i(1,"top"), t("}")
		        },
		        {
        			t("\\xrightarrow["), i(1,"bottom"), t("]{"), i(2,"top"), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cf", name = "Continued fraction", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\cfrac{"), i(1,"num"), t("}{"),
					t({"",""}), t("    "), i(2,"den"),
					t({"",""}), t("}")
                },
                {
                    t("\\cfrac["), i(1,"num-alignment"), t("]{"), i(2,"num"), t("}{"),
					t({"",""}), t("    "), i(3,"den"),
					t({"",""}), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])bx", name = "Boxed formula", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\boxed{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ff", name = "Fraction", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\frac{"), i(1), t("}{"), i(2), t("}")
                },
                {
                    t("\\dfrac{"), i(1), t("}{"), i(2), t("}")
                },
                {
                    t("\\tfrac{"), i(1), t("}{"), i(2), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])bm", name = "Binomial coefficient", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\binom{"), i(1), t("}{"), i(2), t("}")
                },
                {
                    t("\\dbinom{"), i(1), t("}{"), i(2), t("}")
                },
                {
                    t("\\tbinom{"), i(1), t("}{"), i(2), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

-- Decorations

s({trig = "([^%a])abv", name = "Place material above", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\overset{"), i(1,"above"), t("}{"), v(2,"material"), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])bel", name = "Place material below", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\underset{"), i(1,"below"), t("}{"), v(2,"material"), t("}")
    },
    {condition = in_mathzone}
),

-- Limiting positions

s({trig = "lim", name = "Above/below operator", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\limits")
    },
    {condition = in_mathzone}
),

s({trig = "nli", name = "Right of the operator", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
        t("\\nolimits")
    },
    {condition = in_mathzone}
),

-- Relations

s({trig = "([^%a])eq", name = "Congruence relation", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\equiv")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mod", name = "Modular relation", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
		            i(1,"..."), t(" \\equiv "), i(2,"..."), t(" \\pmod{"), i(3,"..."), t("}")
		        },
		        {
		            i(1,"..."), t(" \\not\\equiv "), i(2,"..."), t(" \\pmod{"), i(3,"..."), t("}")
		        },
		        {
		            i(1,"..."), t(" \\equiv "), i(2,"..."), t(" \\mod{"), i(3,"..."), t("}")
		        },
		        {
		            i(1,"..."), t(" \\not\\equiv "), i(2,"..."), t(" \\mod{"), i(3,"..."), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sbg", name = "Left triangle", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\vartriangleleft")
                },
                {
                    t("\\ntriangleleft")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sgc", name = "Right triangle", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\vartriangleright")
                },
                {
                    t("\\ntriangleright")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ne", name = "Not equal", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\ne")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nr", name = "Relation negation", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\not")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])app", name = "Approx", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\approx")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cn", name = "Congruent", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\cong")
                },
                {
                    i(1,"\\ncong")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])le", name = "Less or equal", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\le")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ge", name = "Greater or equal", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\ge")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])pc", name = "Precedes", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\prec")
                },
                {
                    i(1,"\\nprec")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sx", name = "Succedes", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\succ")
                },
                {
                    i(1,"\\nsucc")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])re", name = "Relation", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\sim")
                },
                {
                    i(1,"\\nsim")
                }
            }
        )
    },
    {condition = in_mathzone}
),

-- Operators

s({trig = "opr", name = "Define new operator"},
    {
        c(1,
            {
                {
                    t("\\DeclareMathOperator{"), i(1,"cmd"), t("}{"), i(2,"text"), t("}")
                },
                {
                    t("\\DeclareMathOperator*{"), i(1,"cmd"), t("}{"), i(2,"text"), t("}")
                }
            }
        )
    }
),

s({trig = "([^%a])ce", name = "Ceiling", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\lceil "), d(1,get_visual), t(" \\rceil")
                },
                {
                    t("\\left\\lceil "), d(1,get_visual), t(" \\right\\rceil")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])fl", name = "Floor", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\lfloor "), d(1,get_visual), t(" \\rfloor")
                },
                {
                    t("\\left\\lfloor "), d(1,get_visual), t(" \\right\\rfloor")
                }
            }
        )
        
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sq", name = "Square root", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\sqrt{"), d(1,get_visual), t("}")
                },
                {
                    t("\\sqrt["), i(1,"n-th"), t("]{"), d(2,get_visual), t("}")
                },
                {
                    t("\\sqrt[\\leftroot{"), i(1,"x"), t("}\\uproot{"), i(2,"y"), t("} "), i(3,"n-th"), t("]{"), d(4,get_visual), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])imp", name = "Imaginary part", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Im")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])rpa", name = "Real part", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Re")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])opm", name = "Mod operator", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        i(1,"..."), t(" \\bmod "), i(2,"...")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mp", name = "Minus plus", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mp")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])pm", name = "Plus minus", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\pm")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])tm", name = "Times", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\times")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cd", name = "Centered dot", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\cdot")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cir", name = "Circle", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\circ")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])opl", name = "Oplus", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\oplus")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])omt", name = "Otimes", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\otimes")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])dv", name = "Middle bar", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mid")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])xm", name = "Maximum", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\max")
                },
                {
                    t("\\max_{"), i(1,"..."), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mu", name = "Minimum", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\min")
                },
                {
                    t("\\min_{"), i(1,"..."), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nf", name = "Infimum", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\inf")
                },
                {
                    t("\\inf_{"), i(1,"..."), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sr", name = "Supremum", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\sup")
                },
                {
                    t("\\sup_{"), i(1,"..."), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])arg", name = "Argument", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arg")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])deg", name = "Degree", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\deg")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])det", name = "Determinant", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\det")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])dim", name = "Dimension", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\dim")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])gc", name = "Greatest common divisor", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\gcd")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])hm", name = "Hom", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\hom")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])kr", name = "Kernel", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\ker")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lap", name = "Laplacian", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\nabla^2 ")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])div", name = "Divergence", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
        			t("\\nabla\\cdot\\vv{"), i(1), t("}")
		        },
		        {
        			t("\\nabla\\cdot\\vec{"), i(1), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cur", name = "Curl", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
        			t("\\nabla\\times\\vv{"), i(1), t("}")
		        },
		        {
        			t("\\nabla\\times\\vec{"), i(1), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

-- Operators with limits

s({trig = "([^%a])lm", name = "Limit", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\lim_{"), i(1,"..."), t(" \\to "), i(2,"..."), t("}")
                },
                {
					i(1,"\\lim")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lif", name = "liminf", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\liminf_{"), i(1,"..."), t(" \\to "), i(2,"..."), t("}")
                },
                {
					i(1,"\\liminf")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lsu", name = "limsup", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\limsup_{"), i(1,"..."), t(" \\to "), i(2,"..."), t("}")
                },
                {
					i(1,"\\limsup")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lvf", name = "varliminf", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\varliminf_{"), i(1,"..."), t(" \\to "), i(2,"..."), t("}")
                },
                {
					i(1,"\\varliminf")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lvu", name = "varlimsup", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\varlimsup_{"), i(1,"..."), t(" \\to "), i(2,"..."), t("}")
                },
                {
					i(1,"\\varlimsup")
                }
            }
        )
    },
    {condition = in_mathzone}
),

-- Functions

s({trig = "([^%a])fn", name = "Function domain and codomain", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        i(1,"fun"), t(" : "), i(2,"dom"), t(" \\longrightarrow "), i(3,"cod")
    },
    {condition = in_mathzone}
),

s({trig = "fd", name = "Function definition"},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\begin{align*}"),
		t({"",""}), t("    "), i(1,"fun"), t(" : "), i(2,"dom"), t(" & \\longrightarrow "), i(3,"cod"), t(" \\\\"),
		t({"",""}), t("    "), i(4,"point"), t(" & \\longmapsto "), i(5,"img"),
		t({"",""}), t("\\end{align*}")
    }
),

s({trig = "([^%a])sni", name = "sin", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\sin")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])co", name = "cos", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\cos")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])tn", name = "tan", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\tan")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ot", name = "cot", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\cot")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sc", name = "sec", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\sec")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cc", name = "csc", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\csc")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])asin", name = "arcsin", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arcsin")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])acos", name = "arccos", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arccos")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])atan", name = "arctan", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arctan")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])acot", name = "arccot", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arccot")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])asec", name = "arcsec", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arcsec")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])acc", name = "arccsc", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arccsc")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sinh", name = "sinh", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\sinh")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cosh", name = "cosh", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\cosh")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])tanh", name = "tanh", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\tanh")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])coth", name = "coth", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\coth")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sh", name = "sech", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\sech")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])csch", name = "csch", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\csch")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ahsin", name = "arcsinh", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arcsinh")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ahcos", name = "arccosh", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arccosh")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ahtan", name = "arctanh", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arctanh")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ahcot", name = "arccoth", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arccoth")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ahsec", name = "arcsech", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arcsech")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ahcc", name = "arccsch", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\arccsch")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])xp", name = "exp", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\exp")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ln", name = "ln", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\ln")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lg", name = "log", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\log")
    },
    {condition = in_mathzone}
),

-- Ellipsis

s({trig = "([^%a])dd", name = "Lower dots", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\ldots")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cr", name = "Centered dots", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\cdots")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])vd", name = "Vertical dots", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\vdots")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])gd", name = "Diagonal dots", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\ddots")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cln", name = "Colon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\colon")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sln", name = "Semicolon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t(";")
    },
    {condition = in_mathzone}
),

-- Horizontal extensions

s({trig = "([^%a])ovr", name = "Overline", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\overline{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])und", name = "Underline", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\underline{"), d(1,get_visual), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ovb", name = "Overbrace", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\overbrace{"), d(1,get_visual), t("}^{"), i(2,"top"), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])unb", name = "Underbrace", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\underbrace{"), d(1,get_visual), t("}_{"), i(2,"bottom"), t("}")
    },
    {condition = in_mathzone}
),

-- Delimiters

s({trig = "([^%a])dp", name = "Parenthesis", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\left( "), d(1,get_visual), t(" \\right)")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ds", name = "Brackets", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\left[ "), d(1,get_visual), t(" \\right]")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])bb", name = "Braces", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\{ "), d(1,get_visual), t(" \\}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])db", name = "Extensible braces", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\left\\{ "), d(1,get_visual), t(" \\right\\}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])dk", name = "Angle brackets", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\left\\langle "), d(1,get_visual), t(" \\right\\rangle")
                },
                {
                    t("\\langle "), d(1,get_visual), t(" \\rangle")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])da", name = "Pipes", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\left\\lvert"), d(1,get_visual), t(" \\right\\rvert")
                },
                {
                    t("\\lvert"), d(1,get_visual), t(" \\rvert")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])dn", name = "Double pipes", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\left\\lVert"), d(1,get_visual), t(" \\right\\rVert")
                },
                {
                    t("\\lVert"), d(1,get_visual), t(" \\rVert")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])big", name = "Big-d delimiters", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\big")
                },
                {
                    i(1,"\\Big")
                },
                {
                    i(1,"\\bigg")
                },
                {
                    i(1,"\\Bigg")
                }
            }
        )
    },
    {condition = in_mathzone}
),

-- Spacing commands

s({trig = "([^%a])thp", name = "Thin space", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\,")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])mp", name = "Medium space", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\:")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])tkp", name = "Thick space", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\;")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])enp", name = "Enskip", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\enskip")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])qu", name = "Quad", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\quad")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])qq", name = "Double quad", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\qquad")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])thn", name = "Negative thin space", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\!")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])men", name = "Negative medium space", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\negmedspace")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])tkn", name = "Negative thick space", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\negthickspace")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])hs", name = "Horizontal space", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\hspace{"), i(1,"..."), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])vs", name = "Vertical space", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\vspace{"), i(1,"..."), t("}")
    },
    {condition = in_mathzone}
),

-- Greek alphabet

s({trig = "([^%a])[.]a", name = "Alpha", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\alpha")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]b", name = "Beta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\beta")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]c", name = "Chi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\chi")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]D", name = "Uppercase delta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Delta")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]d", name = "Lowercase delta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\delta")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]e", name = "Epsilon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\varepsilon")
                },
                {
                    i(1,"\\epsilon")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]G", name = "Uppercase gamma", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Gamma")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]g", name = "Lowercase gamma", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\gamma")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]h", name = "Eta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\eta")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]i", name = "Iota", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\iota")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]k", name = "Kappa", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\kappa")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]L", name = "Uppercase lambda", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Lambda")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]l", name = "Lowercase lambda", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\lambda")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]m", name = "Mu", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mu")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]n", name = "Nu", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\nu")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]O", name = "Uppercase omega", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Omega")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]o", name = "Lowercase omega", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\omega")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]Ph", name = "Uppercase phi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Phi")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]ph", name = "Lowecase phi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\phi")
                },
                {
                    i(1,"\\varphi")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]Pi", name = "Uppercase pi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Pi")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]pi", name = "Lowercase pi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\pi")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]Ps", name = "Uppercase psi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Psi")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]ps", name = "Lowercase psi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\psi")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]r", name = "Rho", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\rho")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]S", name = "Uppercase sigma", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Sigma")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]s", name = "Lowercase sigma", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\sigma")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]ta", name = "Tau", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\tau")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]Th", name = "Uppercase theta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Theta")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]th", name = "Lowercase theta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\theta")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]U", name = "Uppercase upsilon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Upsilon")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]u", name = "Lowecase upsilon", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\upsilon")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]X", name = "Uppercase xi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\Xi")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]x", name = "Lowercase xi", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\xi")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])[.]z", name = "Zeta", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\zeta")
    },
    {condition = in_mathzone}
),

-- Letter-shaped symbols

s({trig = "([^%a])ha", name = "Aleph", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\aleph")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])hb", name = "Beth", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\beth")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])hd", name = "Daleth", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\daleth")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])hg", name = "Gimel", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\gimel")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ll", name = "ell", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\ell")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])cm", name = "Set complement", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\complement")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])hr", name = "hbar", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\hbar")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])hl", name = "hslash", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\hslash")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])pt", name = "Partial", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\partial")
    },
    {condition = in_mathzone}
),

-- Miscellaneous symbols

s({trig = "([^%a])dl", name = "Dollar sign", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\$")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])hh", name = "Numeral", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\#")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])fy", name = "Infinity", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\infty")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])pr", name = "Prime", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\prime")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])per", name = "Percentaje", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\%")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])amp", name = "Ampersand", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\&")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ang", name = "Angle", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\angle")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nb", name = "Nabla", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\nabla")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ch", name = "Section symbol", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\S")
    },
    {condition = in_mathzone}
),

-- Accents

s({trig = "([^%a])dr", name = "Dot accent", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
					t("\\dot{"), v(1,"..."), t("}")
		        },
		        {
					t("\\ddot{"), v(1,"..."), t("}")
		        },
		        {
					t("\\dddot{"), v(1,"..."), t("}")
		        },
		        {
					t("\\ddddot{"), v(1,"..."), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ht", name = "Hat", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\hat{"), v(1,"..."), t("}")
                },
                {
                    t("\\widehat{"), v(1,"..."), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])rng", name = "Math ring", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\mathring{"), v(1,"..."), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])til", name = "Tilde", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\tilde{"), v(1,"..."), t("}")
                },
                {
                    t("\\widetilde{"), v(1,"..."), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])vv", name = "Vector", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\vv{"), v(1,"..."), t("}")
                },
                {
                    t("\\vec{"), v(1,"..."), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

-- Logic

s({trig = "([^%a])fa", name = "For all", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\forall")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ex", name = "Exists", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\exists")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nx", name = "Not exist", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\nexists")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lt", name = "Logic negation", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\lnot")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lan", name = "Logic and", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\land")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lor", name = "Logic or", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\lor")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ip", name = "Implies", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\implies")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ib", name = "Implied by", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\impliedby")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])iff", name = "If and only if", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\iff")
    },
    {condition = in_mathzone}
),

-- Sets and inclusion

s({trig = "([^%a])in", name = "Belongs to", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\in")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ntn", name = "Not in", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\notin")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])na", name = "Owns", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\ni")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])vc", name = "Empty set", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\emptyset")
                },
                {
                    i(1,"\\varnothing")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nun", name = "Union", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\cup")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])bun", name = "Big union", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigcup")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sun", name = "Big subscript union", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigcup_{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])dun", name = "Big definite union", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigcup_{"), i(1), t("}^{"), i(2), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nit", name = "Intersection", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\cap")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])bit", name = "Big intersection", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigcap")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sit", name = "Big subscript intersection", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigcap_{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])dit", name = "Big definite intersection", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigcap_{"), i(1), t("}^{"), i(2), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sf", name = "Set difference", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\setminus")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sbs", name = "Subset", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\subset")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sbq", name = "Subset or equals", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\subseteq")
                },
                {
                    i(1,"\\nsubseteq")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sps", name = "Contains", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\subset")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])spq", name = "Contains or equals", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\supseteq")
                },
                {
                    i(1,"\\nsupseteq")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])setd", name = "Dots set", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\{ "), i(1), t(" \\std "), i(2), t(" \\}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])setb", name = "Bar set", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\{ "), i(1), t(" \\mid "), i(2), t(" \\}")
    },
    {condition = in_mathzone}
),

-- Arrows

s({trig = "([^%a])rar", name = "Long right arrow", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\longrightarrow")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])lar", name = "Long left arrow", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\longleftarrow")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])to", name = "Long maps to", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\longmapsto")
    },
    {condition = in_mathzone}
),

-- Sums

s({trig = "([^%a])ssm", name = "Subscript sum", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\sum_{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nsm", name = "Definite sum", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\sum_{"), i(1), t("}^{"), i(2), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])sosm", name = "Subscript o-sum", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigoplus_{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nosm", name = "Definite o-sum", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigoplus_{"), i(1), t("}^{"), i(2), t("}")
    },
    {condition = in_mathzone}
),

-- Products

s({trig = "([^%a])suc", name = "Subscript product", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\prod_{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nuc", name = "Definite product", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\prod_{"), i(1), t("}^{"), i(2), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])souc", name = "Subscript o-product", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigotimes_{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])nouc", name = "Definite o-product", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\bigotimes{"), i(1), t("}^{"), i(2), t("}")
    },
    {condition = in_mathzone}
),

-- Derivatives

s({trig = "([^%a])df", name = "Differential", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\dx")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])der", name = "Derivative", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
        			t("\\der{"), i(1,"func"), t("}{"), i(2,"var"), t("}")
		        },
		        {
        			t("\\Der{"), i(1,"func"), t("}{"), i(2,"var"), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ndr", name = "n-th derivative", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
        			t("\\ndr{"), i(1,"n"), t("}{"), i(2,"func"), t("}{"), i(3,"var"), t("}")
		        },
		        {
        			t("\\Ndr{"), i(1,"n"), t("}{"), i(2,"func"), t("}{"), i(3,"var"), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])pdr", name = "Partial derivative", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
        			t("\\pdr{"), i(1,"func"), t("}{"), i(2,"var"), t("}")
		        },
		        {
        			t("\\Pdr{"), i(1,"func"), t("}{"), i(2,"var"), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])npd", name = "n-th partial derivative", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		c(1,
		    {
		        {
        			t("\\npd{"), i(1,"n"), t("}{"), i(2,"func"), t("}{"), i(3,"var"), t("}")
		        },
		        {
        			t("\\Npd{"), i(1,"n"), t("}{"), i(2,"func"), t("}{"), i(3,"var"), t("}")
		        }
		    }
		)
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])evl", name = "Derivative evaluation", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\evl{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

-- Integrals

s({trig = "([^%a])itn", name = "Integral", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\int")
                },
                {
                    i(1,"\\oint")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])its", name = "Subscript integral", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\int_{"), i(1), t("}")
                },
                {
                    t("\\oint_{"), i(1), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itd", name = "Definite integral", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        t("\\int_{"), i(1), t("}^{"), i(2), t("}")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itbn", name = "Double integral", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\iint")
                },
                {
                    i(1,"\\oiint")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itbs", name = "Double integral subscript", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\iint_{"), i(1), t("}")
                },
                {
                    t("\\oiint_{"), i(1), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])ittn", name = "Triple integral", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\iiint")
                },
                {
                    i(1,"\\oiiint")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itts", name = "Triple integral subscript", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\iiint_{"), i(1), t("}")
                },
                {
                    t("\\oiiint_{"), i(1), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itqn", name = "Quadruple integral", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    i(1,"\\iiiint")
                },
                {
                    i(1,"\\oiiint")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itqs", name = "Quadruple integral subscript", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
        c(1,
            {
                {
                    t("\\iiint_{"), i(1), t("}")
                },
                {
                    t("\\oiiint_{"), i(1), t("}")
                }
            }
        )
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itmn", name = "Multiple integral", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		t("\\idotsint")
    },
    {condition = in_mathzone}
),

s({trig = "([^%a])itms", name = "Multiple integral subscript", snippetType = "autosnippet", regTrig = true, wordTrig = false},
    {
		f(function(_,snip) return snip.captures[1] end),
		t("\\idotsint_{"), i(1), t("}")
    },
    {condition = in_mathzone}
),

}
