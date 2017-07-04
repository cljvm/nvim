if owl#plug_setting('denite.nvim')
    let s:work_base_path = 'E:\share\work\stm\ecpweb\WebContent\page\stm\'
    let s:menus = {}
    let s:menus.work = {
                \ 'description': '工作',
                \ }
    let s:menus.work.file_candidates = [
                \ ['    > 转账汇款', s:work_base_path . 'transfer'],
                \ ['    > 回单补打', s:work_base_path . 'voucher'],
                \ ['    > 信用卡', s:work_base_path . 'creditCard3'],
                \ ['    > 外汇买卖', s:work_base_path . 'foreignExchange\forexTransaction'],
                \ ['    > 钞折汇', s:work_base_path . 'foreignExchange\cashToSpot'],
                \ ['    > 结售汇', s:work_base_path . 'foreignExchange\settlement'],
                \ ['    > 账户商品', s:work_base_path . 'accProduct'],
                \ ]
    call denite#custom#var('menu', 'menus', s:menus)
endif