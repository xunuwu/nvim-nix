{
  plugins.mini.modules.statusline = {
    # doesnt show modified status without this for some reason
    content.inactive.__raw = ''
      function()
         local statusline = require('mini.statusline')
         return statusline.combine_groups({
            { hl = 'MiniStatuslineInactive', strings = { statusline.section_filename({ trunc_width = 140 }) } },
         })
      end
    '';
  };
}
