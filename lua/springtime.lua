local M = {}

M.SETTINGS = {
    spring = {
        project = {
            selected = 1
        },
        language = {
            selected = 1
        },
        packaging = {
            selected = 1
        },
        project_metadata = {
            group = "com.example",
            artifact = "demo",
            name = "demo",
            package_name = "com.example.demo",
            version = "0.0.1-SNAPSHOT"
        }
    },
    dialog = {
        selection_keymap = "<C-Space>",
        generate_keymap = "<C-CR>",
        confirmation = true,
        style = {
            title_link = "Boolean",
            section_link = "Type"
        }
    },
    workspace = {
        path = vim.fn.expand("%:p:h"),
        decompress = true,
        open_auto = true
    },
    internal = {
        log_debug = false
    }
}

function M.setup(opts)
    if opts.spring then
        local spring = opts.spring
        if spring.project then
            M.SETTINGS.spring.project.selected = (type(spring.project.selected) == "number" and spring.project.selected) or
            M.SETTINGS.spring.project.selected
        end
        if spring.language then
            M.SETTINGS.spring.language.selected = (type(spring.language.selected) == "number" and spring.language.selected) or
            M.SETTINGS.spring.language.selected
        end
        if spring.packaging then
            M.SETTINGS.spring.packaging.selected = (type(spring.packaging.selected) == "number" and spring.packaging.selected) or
            M.SETTINGS.spring.packaging.selected
        end

        if spring.java_version then
            if type(spring.java_version.selected) == "number" then
                M.SETTINGS.spring.java_version = { selected = spring.java_version.selected }
            end
            if type(spring.java_version.values) == "table" then
                if M.SETTINGS.spring.java_version and M.SETTINGS.spring.java_version.selected then
                    M.SETTINGS.spring.java_version.values = spring.java_version.values
                else
                    M.SETTINGS.spring.java_version = { values = spring.java_version.values }
                end
            end
        end
        if spring.spring_boot then
            if type(spring.spring_boot.selected) == "number" then
                M.SETTINGS.spring.spring_boot = { selected = spring.spring_boot.selected }
            end
            if type(spring.java_version.values) == "table" then
                if M.SETTINGS.spring.spring_boot and M.SETTINGS.spring.spring_boot.selected then
                    M.SETTINGS.spring.spring_boot.values = spring.spring_boot.values
                else
                    M.SETTINGS.spring.spring_boot = { values = spring.spring_boot.values }
                end
            end
        end

        if spring.project_metadata then
            M.SETTINGS.spring.project_metadata.group = spring.project_metadata.group or
            M.SETTINGS.spring.project_metadata.group
            M.SETTINGS.spring.project_metadata.artifact = spring.project_metadata.artifact or
            M.SETTINGS.spring.project_metadata.artifact
            M.SETTINGS.spring.project_metadata.name = spring.project_metadata.name or
            M.SETTINGS.spring.project_metadata.name
            M.SETTINGS.spring.project_metadata.package_name = spring.project_metadata.package_name or
            M.SETTINGS.spring.project_metadata.package_name
            M.SETTINGS.spring.project_metadata.version = spring.project_metadata.version or
            M.SETTINGS.spring.project_metadata.version
        end
    end

    if opts.dialog then
        local dialog = opts.dialog
        M.SETTINGS.dialog.selection_keymap = dialog.selection_keymap or M.SETTINGS.dialog.selection_keymap
        M.SETTINGS.dialog.generate_keymap = dialog.generate_keymap or M.SETTINGS.dialog.generate_keymap
        M.SETTINGS.dialog.confirmation = (type(dialog.confirmation) == "boolean" and dialog.confirmation) or
        M.SETTINGS.dialog.confirmation

        if dialog.style then
            M.SETTINGS.dialog.style.title_link = dialog.style.title_link or M.SETTINGS.dialog.style.title_link
            M.SETTINGS.dialog.style.section_link = dialog.style.section_link or M.SETTINGS.dialog.style.section_link
        end
    end

    if opts.workspace then
        local workspace = opts.workspace
        M.SETTINGS.workspace.path = workspace.path or M.SETTINGS.workspace.path
        M.SETTINGS.workspace.decompress = (type(workspace.decompress) == "boolean" and workspace.decompress) or
        M.SETTINGS.workspace.decompress
        M.SETTINGS.workspace.open_auto = (type(workspace.open_auto) == "boolean" and workspace.open_auto) or
        M.SETTINGS.workspace.open_auto
    end

    if opts.internal then
        local internal = opts.internal
        M.SETTINGS.internal.log_debug = (type(internal.log_debug) == "boolean" and internal.log_debug) or M.SETTINGS.internal.log_debug
    end

    require 'springtime.util'.logger:debug("Setup options: " .. vim.inspect(M.SETTINGS))
end

return M
