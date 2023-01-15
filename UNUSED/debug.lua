{
-- debug function to test lua spell lists, unused in the script
function mpr_spells(mons)
    local books = nil
    books = mons:spells()

    if books ~= nil then
        for _,book in ipairs(books) do
            crawl.mpr("Known spells: ")
            for _,spell in ipairs(book) do
                crawl.mpr(spell)
            end
        end
    end
end
}
