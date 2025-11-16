MathJax = {
  tex: {
    inlineMath: [['\\(', '\\)'], ['$', '$']],
    displayMath: [['\\[', '\\]'], ['$$', '$$']],
    macros: {
      // Define your custom macros here
      "\\RR": "\\mathbb{R}",
      "\\CC": "\\mathbb{C}",
      '\\NN': '\\mathbb{N}',
      '\\QQ': '\\mathbb{Q}',
      '\\PP': '\\mathbb{P}',
      '\\EE': '\\mathbb{E}',
      '\\ZZ': '\\mathbb{Z}',
      // ... other macros
    },
    tags: 'ams',
    packages: {'[+]': ['ams', 'color']}
  },
  // ... rest of config
};