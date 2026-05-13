{
    "type": "MySQLNotebook",
    "version": "1.0",
    "caption": "DB Notebook",
    "content": "\\about\nuse cricketers_1;\ncreate database cricketers_1;\ncreate table players_1\n(s_no int, name varchar(40), team varchar(20), score int);\n\nshow tables;\ninsert into players_1 values(1,\"M.S.Dhoni\",\"CSK\",145),\n(2,\"Virat Kohli\",\"RCB\",119),(3,\"Hardik Pandya\",\"MI\",140);\ndesc players_1;\ninsert into players_1 values(4,\"K.L.Rahul\",\"PKBS\",113);\nselect * from players_1;\ntruncate table players_1;\ndrop table players_1;\ndrop database cricketers_1;\n\n",
    "options": {
        "tabSize": 4,
        "indentSize": 4,
        "insertSpaces": true,
        "defaultEOL": "LF",
        "trimAutoWhitespace": true
    },
    "viewState": {
        "cursorState": [
            {
                "inSelectionMode": false,
                "selectionStart": {
                    "lineNumber": 11,
                    "column": 56
                },
                "position": {
                    "lineNumber": 11,
                    "column": 56
                }
            }
        ],
        "viewState": {
            "scrollLeft": 0,
            "firstPosition": {
                "lineNumber": 1,
                "column": 1
            },
            "firstPositionDeltaTop": 0
        },
        "contributionsState": {
            "editor.contrib.folding": {},
            "editor.contrib.wordHighlighter": false
        }
    },
    "contexts": [
        {
            "state": {
                "start": 1,
                "end": 1,
                "language": "mysql",
                "result": {
                    "type": "text",
                    "text": [
                        {
                            "type": 2,
                            "content": "Welcome to the MySQL Shell - DB Notebook.\n\nPress Ctrl+Enter to execute the code block.\n\nExecute \\sql to switch to SQL, \\js to JavaScript and \\ts to TypeScript mode.\nExecute \\help or \\? for help;",
                            "language": "ansi"
                        }
                    ]
                },
                "currentHeight": 119.359375,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 6
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        },
        {
            "state": {
                "start": 2,
                "end": 16,
                "language": "mysql",
                "result": {
                    "type": "resultIds",
                    "list": [
                        "798d6716-5570-4758-b21c-8f0b7c00cb58",
                        "ff417bc0-da02-4896-dfa9-c6bd1417cada"
                    ]
                },
                "currentHeight": 36,
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 17
                        },
                        "contentStart": 0,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 17,
                            "length": 30
                        },
                        "contentStart": 18,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 47,
                            "length": 82
                        },
                        "contentStart": 48,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 129,
                            "length": 14
                        },
                        "contentStart": 131,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 143,
                            "length": 113
                        },
                        "contentStart": 144,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 256,
                            "length": 16
                        },
                        "contentStart": 258,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 272,
                            "length": 56
                        },
                        "contentStart": 273,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 328,
                            "length": 25
                        },
                        "contentStart": 329,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 353,
                            "length": 26
                        },
                        "contentStart": 354,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 379,
                            "length": 22
                        },
                        "contentStart": 381,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 401,
                            "length": 28
                        },
                        "contentStart": 403,
                        "state": 0
                    },
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 429,
                            "length": 1
                        },
                        "contentStart": 428,
                        "state": 3
                    }
                ]
            },
            "data": [
                {
                    "tabId": "07878aa0-1685-4447-a796-d2ad85804576",
                    "resultId": "798d6716-5570-4758-b21c-8f0b7c00cb58",
                    "rows": [
                        {
                            "0": 1,
                            "1": "M.S.Dhoni",
                            "2": "CSK",
                            "3": 145
                        },
                        {
                            "0": 2,
                            "1": "Virat Kohli",
                            "2": "RCB",
                            "3": 119
                        },
                        {
                            "0": 3,
                            "1": "Hardik Pandya",
                            "2": "MI",
                            "3": 140
                        },
                        {
                            "0": 1,
                            "1": "M.S.Dhoni",
                            "2": "CSK",
                            "3": 145
                        },
                        {
                            "0": 2,
                            "1": "Virat Kohli",
                            "2": "RCB",
                            "3": 119
                        },
                        {
                            "0": 3,
                            "1": "Hardik Pandya",
                            "2": "MI",
                            "3": 140
                        }
                    ],
                    "columns": [
                        {
                            "title": "s_no",
                            "field": "0",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "name",
                            "field": "1",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "team",
                            "field": "2",
                            "dataType": {
                                "type": 17,
                                "characterMaximumLength": 65535,
                                "flags": [
                                    "BINARY",
                                    "ASCII",
                                    "UNICODE"
                                ],
                                "needsQuotes": true,
                                "parameterFormatType": "OneOrZero"
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        },
                        {
                            "title": "score",
                            "field": "3",
                            "dataType": {
                                "type": 4,
                                "flags": [
                                    "SIGNED",
                                    "ZEROFILL"
                                ],
                                "numericPrecision": 10,
                                "parameterFormatType": "OneOrZero",
                                "synonyms": [
                                    "INTEGER",
                                    "INT4"
                                ]
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 6 records retrieved in 1.156ms"
                    },
                    "totalRowCount": 6,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 7,
                    "sql": "\nselect * from players_1;",
                    "updatable": false,
                    "fullTableName": "players_1"
                },
                {
                    "tabId": "07878aa0-1685-4447-a796-d2ad85804576",
                    "resultId": "ff417bc0-da02-4896-dfa9-c6bd1417cada",
                    "rows": [],
                    "columns": [
                        {
                            "title": "*",
                            "field": "0",
                            "dataType": {
                                "type": 0
                            },
                            "inPK": false,
                            "nullable": false,
                            "autoIncrement": false
                        }
                    ],
                    "executionInfo": {
                        "text": "OK, 0 records retrieved in 24.208ms"
                    },
                    "totalRowCount": 0,
                    "hasMoreRows": false,
                    "currentPage": 0,
                    "index": 8,
                    "sql": "\ntruncate table players_1;",
                    "updatable": false
                }
            ]
        },
        {
            "state": {
                "start": 17,
                "end": 17,
                "language": "mysql",
                "currentSet": 1,
                "statements": [
                    {
                        "delimiter": ";",
                        "span": {
                            "start": 0,
                            "length": 0
                        },
                        "contentStart": 0,
                        "state": 0
                    }
                ]
            },
            "data": []
        }
    ]
}