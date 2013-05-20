class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.integer  :code          # 植物代码
      # 一 常用选种指标
      t.string   :zw            # 中文
      t.string   :ldm           # 拉丁名
      t.string   :cdxzzb        # 场地限制指标（乔灌草）
      t.string   :cl            # 常绿/落叶
      t.string   :xzd           # 显著度
      t.string   :zygsbw        # 主要观赏部位
      t.string   :sd            # 色调
      t.string   :flsgsq        # 非绿色赏期
      # 二 正向服务潜力排序
      t.string   :zhstfwqlpx    # 综合生态服务潜力排序
      t.string   :jwzs          # 降温增湿
      t.string   :gtsy          # 固碳释氧
      t.string   :zc            # 滞尘
      t.string   :hjwr          # 缓解污染
      t.string   :bctr          # 保持土壤
      # 三 适应性指标
      t.string   :yzxx          # 引种信息
      t.string   :gsydj         # 光适应等级
      t.string   :trsfsyxdj     # 土壤水分适应性等级
      t.string   :phmin         # ph最小值
      t.string   :phmax         # ph最大值
      t.string   :apmin         # AP最小值（mg/kg）
      t.string   :apmax         # AP最大值（mg/kg）
      t.string   :akmin         # AK最小值（mg/kg）
      t.string   :akmax         # AK最大值（mg/kg）
      t.string   :tnmin         # TN最小值（g/kg）
      t.string   :tnmax         # TN最大值（g/kg）
      t.string   :socmin        # SOC最小值（g/kg）
      t.string   :socmax        # SOC最大值（g/kg）
      t.string   :sbdmin        # SBD最小值（g/cm3）
      t.string   :sbdmax        # SBD最大值（g/cm3）
      # 四 负服务
      t.string   :sfjdx         # 是否具毒性
      t.string   :sfjhfzmx      # 是否具花粉致敏性
      t.string   :sfjc          # 是否具刺
      # 五 辅助指标
      t.string   :ke            # 科
      t.string   :shu           # 属
      t.string   :bjzwzym       # 《北京植物志》页码
      t.string   :zysj          # 主要生境
      t.string   :gss           # 观赏色
      t.string   :yjlyqy        # 引种来源区域
      t.string   :kdzg          # 可达株高
      t.string   :zysq          # 主要赏期
      t.timestamps
    end
  end
end
