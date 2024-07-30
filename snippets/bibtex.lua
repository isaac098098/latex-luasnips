-- Bibliography and citations

-- Citations

return {

s({trig = "cst", name = "Citation style"},
    {
        t("\\citestyle{"), i(1,"..."), t("}")
    }
),

s({trig = "ct", name = "Citation"},
    {
        c(1,
            {
                {
                    t("\\cite{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\cite["), i(1,"text"), t("]{"), i(2,"key-list"), t("}")
                }
            }
        )
    }
),

s({trig = "cf", name = "Full citation"},
    {
        c(1,
            {
                {
                    t("\\fullcite{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\fullcite["), i(1,"post-note"), t("]{"), i(2,"key-list"), t("}")
                },
                {
                    t("\\fullcite["), i(1,"annotator"), t("]["), i(2,"post-note"), t("]{"), i(2,"key-list"), t("}")
                }
            }
        )
    }
),

s({trig = "ctn", name = "Cite not cited"},
    {
        c(1,
            {
                {
                    t("\\nocite{"), i(1,"key-list"), t("}")
                },
                {
                    i(1,"\\nocite{*}")
                }
            }
        )
    }
),

s({trig = "tc", name = "Textual citation"},
    {
        c(1,
            {
                {
                    t("\\citet{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\citet["), i(1,"post-note"), t("]{"), i(2,"key-list"), t("}")
                },
                {
                    t("\\citet["), i(1,"pre-note"), t("]["), i(2,"post-note"), t("]{"), i(3,"key-list"), t("}")
                },
                {
                    t("\\citet*{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\citet*["), i(1,"post-note"), t("]{"), i(2,"key-list"), t("}")
                },
                {
                    t("\\citet*["), i(1,"pre-note"), t("]["), i(2,"post-note"), t("]{"), i(3,"key-list"), t("}")
                }
            }
        )
    }
),

s({trig = "tnc", name = "No parentheses textual citation"},
    {
        c(1,
            {
                {
                    t("\\citealt{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\citealt["), i(1,"post-note"), t("]{"), i(2,"key-list"), t("}")
                },
                {
                    t("\\citealt["), i(1,"pre-note"), t("]["), i(2,"post-note"), t("]{"), i(3,"key-list"), t("}")
                },
                {
                    t("\\citealt*{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\citealt*["), i(1,"post-note"), t("]{"), i(2,"key-list"), t("}")
                },
                {
                    t("\\citealt*["), i(1,"pre-note"), t("]["), i(2,"post-note"), t("]{"), i(3,"key-list"), t("}")
                }
            }
        )
    }
),

s({trig = "tpc", name = "Parenthetical citation"},
    {
        c(1,
            {
                {
                    t("\\citep{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\citep["), i(1,"post-note"), t("]{"), i(2,"key-list"), t("}")
                },
                {
                    t("\\citep["), i(1,"pre-note"), t("]["), i(2,"post-note"), t("]{"), i(3,"key-list"), t("}")
                },
                {
                    t("\\citep*{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\citep*["), i(1,"post-note"), t("]{"), i(2,"key-list"), t("}")
                },
                {
                    t("\\citep*["), i(1,"pre-note"), t("]["), i(2,"post-note"), t("]{"), i(3,"key-list"), t("}")
                }
            }
        )
    }
),

s({trig = "auc", name = "Author citation"},
    {
        c(1,
            {
                {
                    t("\\citeauthor{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\citeauthor*{"), i(1,"key-list"), t("}")
                }
            }
        )
    }
),

s({trig = "yec", name = "Year citation"},
    {
        c(1,
            {
                {
                    t("\\cityear{"), i(1,"key-list"), t("}")
                },
                {
                    t("\\citeyearpar{"), i(1,"key-list"), t("}")
                }
            }
        )
    }
),

-- Bibliography

s({trig = "bib", name = "Bibliography files"},
    {
        t("\\bibliography{"), i(1,"file-list"), t("}")
    }
),

s({trig = "bisty", name = "Bibliography style"},
    {
        t("\\bibliographystyle{"), i(1,"style"), t("}")
    }
),

}
