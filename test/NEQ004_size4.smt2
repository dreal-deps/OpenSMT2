(set-logic QF_UF)
(set-info :source |
CADE ATP System competition. See http://www.cs.miami.edu/~tptp/CASC
 for more information. 

This benchmark was obtained by trying to find a finite model of a first-order 
formula (Albert Oliveras).
|)
(set-info :smt-lib-version 2.0)
(set-info :category "crafted")
(set-info :status unsat)
(set-option :produce-stats true)
(set-option :stats-out "statistics.out")
(set-option :random-seed 6)
(declare-sort U 0)
(declare-fun c14 () U)
(declare-fun c12 () U)
(declare-fun p4 (U U) Bool)
(declare-fun c13 () U)
(declare-fun p3 (U U) Bool)
(declare-fun c15 () U)
(declare-fun c17 () U)
(declare-fun p6 (U U) Bool)
(declare-fun p2 (U U) Bool)
(declare-fun p1 (U U) Bool)
(declare-fun c11 () U)
(declare-fun f5 (U U) U)
(declare-fun c10 () U)
(declare-fun p8 (U) Bool)
(declare-fun c16 () U)
(declare-fun p9 (U U) Bool)
(declare-fun p7 (U U) Bool)
(declare-fun c_0 () U)
(declare-fun c_1 () U)
(declare-fun c_2 () U)
(declare-fun c_3 () U)
(assert
 (let ((?v_52 (= c_0 c_0)))
 (let ((?v_16 (not ?v_52)) (?v_32 (p3 c_0 c_0)) (?v_55 (= c_0 c_1)))
 (let ((?v_17 (not ?v_55)) (?v_33 (p3 c_0 c_1)) (?v_58 (= c_0 c_2)))
 (let ((?v_18 (not ?v_58)) (?v_34 (p3 c_0 c_2)) (?v_61 (= c_0 c_3)))
 (let ((?v_19 (not ?v_61)) (?v_35 (p3 c_0 c_3)) (?v_64 (= c_1 c_0)))
 (let ((?v_20 (not ?v_64)) (?v_36 (p3 c_1 c_0)) (?v_67 (= c_1 c_1)))
 (let ((?v_21 (not ?v_67)) (?v_37 (p3 c_1 c_1)) (?v_70 (= c_1 c_2)))
 (let ((?v_22 (not ?v_70)) (?v_38 (p3 c_1 c_2)) (?v_73 (= c_1 c_3)))
 (let ((?v_23 (not ?v_73)) (?v_39 (p3 c_1 c_3)) (?v_76 (= c_2 c_0)))
 (let ((?v_24 (not ?v_76)) (?v_40 (p3 c_2 c_0)) (?v_79 (= c_2 c_1)))
 (let ((?v_25 (not ?v_79)) (?v_41 (p3 c_2 c_1)) (?v_82 (= c_2 c_2)))
 (let ((?v_26 (not ?v_82)) (?v_42 (p3 c_2 c_2)) (?v_85 (= c_2 c_3)))
 (let ((?v_27 (not ?v_85)) (?v_43 (p3 c_2 c_3)) (?v_88 (= c_3 c_0)))
 (let ((?v_28 (not ?v_88)) (?v_44 (p3 c_3 c_0)) (?v_91 (= c_3 c_1)))
 (let ((?v_29 (not ?v_91)) (?v_45 (p3 c_3 c_1)) (?v_94 (= c_3 c_2)))
 (let ((?v_30 (not ?v_94)) (?v_46 (p3 c_3 c_2)) (?v_97 (= c_3 c_3)))
 (let ((?v_31 (not ?v_97)) (?v_47 (p3 c_3 c_3)) (?v_53 (p4 c_0 c_0)))
 (let ((?v_0 (not ?v_53)) (?v_56 (p4 c_0 c_1)))
 (let ((?v_2 (not ?v_56)) (?v_65 (p4 c_1 c_0)))
 (let ((?v_1 (not ?v_65)) (?v_59 (p4 c_0 c_2)))
 (let ((?v_5 (not ?v_59)) (?v_77 (p4 c_2 c_0)))
 (let ((?v_4 (not ?v_77)) (?v_62 (p4 c_0 c_3)))
 (let ((?v_10 (not ?v_62)) (?v_89 (p4 c_3 c_0)))
 (let ((?v_9 (not ?v_89)) (?v_68 (p4 c_1 c_1)))
 (let ((?v_3 (not ?v_68)) (?v_71 (p4 c_1 c_2)))
 (let ((?v_7 (not ?v_71)) (?v_80 (p4 c_2 c_1)))
 (let ((?v_6 (not ?v_80)) (?v_74 (p4 c_1 c_3)))
 (let ((?v_12 (not ?v_74)) (?v_92 (p4 c_3 c_1)))
 (let ((?v_11 (not ?v_92)) (?v_83 (p4 c_2 c_2)))
 (let ((?v_8 (not ?v_83)) (?v_86 (p4 c_2 c_3)))
 (let ((?v_14 (not ?v_86)) (?v_95 (p4 c_3 c_2)))
 (let ((?v_13 (not ?v_95)) (?v_98 (p4 c_3 c_3)))
 (let
  ((?v_15 (not ?v_98))
  (?v_54 (p2 c_0 c_0))
  (?v_66 (p2 c_1 c_0))
  (?v_78 (p2 c_2 c_0))
  (?v_90 (p2 c_3 c_0))
  (?v_57 (p2 c_0 c_1))
  (?v_69 (p2 c_1 c_1))
  (?v_81 (p2 c_2 c_1))
  (?v_93 (p2 c_3 c_1))
  (?v_60 (p2 c_0 c_2))
  (?v_72 (p2 c_1 c_2))
  (?v_84 (p2 c_2 c_2))
  (?v_96 (p2 c_3 c_2))
  (?v_63 (p2 c_0 c_3))
  (?v_75 (p2 c_1 c_3))
  (?v_87 (p2 c_2 c_3))
  (?v_99 (p2 c_3 c_3))
  (?v_100 (p1 c_0 c_0))
  (?v_101 (p1 c_0 c_1))
  (?v_102 (p1 c_0 c_2))
  (?v_103 (p1 c_0 c_3))
  (?v_104 (p1 c_1 c_0))
  (?v_105 (p1 c_1 c_1))
  (?v_106 (p1 c_1 c_2))
  (?v_107 (p1 c_1 c_3))
  (?v_108 (p1 c_2 c_0))
  (?v_109 (p1 c_2 c_1))
  (?v_110 (p1 c_2 c_2))
  (?v_111 (p1 c_2 c_3))
  (?v_112 (p1 c_3 c_0))
  (?v_113 (p1 c_3 c_1))
  (?v_114 (p1 c_3 c_2))
  (?v_115 (p1 c_3 c_3))
  (?v_117 (f5 c_0 c_0))
  (?v_48 (not (p8 c_0)))
  (?v_116 (p6 c_0 c_0))
  (?v_119 (f5 c_0 c_1))
  (?v_118 (p6 c_0 c_1))
  (?v_121 (f5 c_0 c_2))
  (?v_120 (p6 c_0 c_2))
  (?v_123 (f5 c_0 c_3))
  (?v_122 (p6 c_0 c_3))
  (?v_125 (f5 c_1 c_0))
  (?v_49 (not (p8 c_1)))
  (?v_124 (p6 c_1 c_0))
  (?v_127 (f5 c_1 c_1))
  (?v_126 (p6 c_1 c_1))
  (?v_129 (f5 c_1 c_2))
  (?v_128 (p6 c_1 c_2))
  (?v_131 (f5 c_1 c_3))
  (?v_130 (p6 c_1 c_3))
  (?v_133 (f5 c_2 c_0))
  (?v_50 (not (p8 c_2)))
  (?v_132 (p6 c_2 c_0))
  (?v_135 (f5 c_2 c_1))
  (?v_134 (p6 c_2 c_1))
  (?v_137 (f5 c_2 c_2))
  (?v_136 (p6 c_2 c_2))
  (?v_139 (f5 c_2 c_3))
  (?v_138 (p6 c_2 c_3))
  (?v_141 (f5 c_3 c_0))
  (?v_51 (not (p8 c_3)))
  (?v_140 (p6 c_3 c_0))
  (?v_143 (f5 c_3 c_1))
  (?v_142 (p6 c_3 c_1))
  (?v_145 (f5 c_3 c_2))
  (?v_144 (p6 c_3 c_2))
  (?v_147 (f5 c_3 c_3))
  (?v_146 (p6 c_3 c_3)))


 (let ((?v_148 (not ?v_54))
  (?v_152 (not ?v_66))
  (?v_156 (not ?v_78))
  (?v_160 (not ?v_90))
  (?v_149 (not ?v_57))
  (?v_153 (not ?v_69))
  (?v_157 (not ?v_81))
  (?v_161 (not ?v_93))
  (?v_150 (not ?v_60))
  (?v_154 (not ?v_72))
  (?v_158 (not ?v_84))
  (?v_162 (not ?v_96))
  (?v_151 (not ?v_63))
  (?v_155 (not ?v_75))
  (?v_159 (not ?v_87))
  (?v_163 (not ?v_99))
  (?v_164 (p9 c_0 c_0)))


(let ((?v_212 (not ?v_164)) (?v_196 (p7 c_0 c_0)))
(let ((?v_165 (not ?v_196)) (?v_166 (p9 c_0 c_1)))
(let ((?v_213 (not ?v_166)) (?v_197 (p7 c_0 c_1)))
(let ((?v_167 (not ?v_197)) (?v_168 (p9 c_0 c_2)))
(let ((?v_214 (not ?v_168)) (?v_198 (p7 c_0 c_2)))
(let ((?v_169 (not ?v_198)) (?v_170 (p9 c_0 c_3)))
(let ((?v_215 (not ?v_170)) (?v_199 (p7 c_0 c_3)))
(let ((?v_171 (not ?v_199)) (?v_172 (p9 c_1 c_0)))
(let ((?v_216 (not ?v_172)) (?v_200 (p7 c_1 c_0)))
(let ((?v_173 (not ?v_200)) (?v_174 (p9 c_1 c_1)))
(let ((?v_217 (not ?v_174)) (?v_201 (p7 c_1 c_1)))
(let ((?v_175 (not ?v_201)) (?v_176 (p9 c_1 c_2)))
(let ((?v_218 (not ?v_176)) (?v_202 (p7 c_1 c_2)))
(let ((?v_177 (not ?v_202)) (?v_178 (p9 c_1 c_3)))
(let ((?v_219 (not ?v_178)) (?v_203 (p7 c_1 c_3)))
(let ((?v_179 (not ?v_203)) (?v_180 (p9 c_2 c_0)))
(let ((?v_220 (not ?v_180)) (?v_204 (p7 c_2 c_0)))
(let ((?v_181 (not ?v_204)) (?v_182 (p9 c_2 c_1)))
(let ((?v_221 (not ?v_182)) (?v_205 (p7 c_2 c_1)))
(let ((?v_183 (not ?v_205)) (?v_184 (p9 c_2 c_2)))
(let ((?v_222 (not ?v_184)) (?v_206 (p7 c_2 c_2)))
(let ((?v_185 (not ?v_206)) (?v_186 (p9 c_2 c_3)))
(let ((?v_223 (not ?v_186)) (?v_207 (p7 c_2 c_3)))
(let ((?v_187 (not ?v_207)) (?v_188 (p9 c_3 c_0)))
(let ((?v_224 (not ?v_188)) (?v_208 (p7 c_3 c_0)))
(let ((?v_189 (not ?v_208)) (?v_190 (p9 c_3 c_1)))
(let ((?v_225 (not ?v_190)) (?v_209 (p7 c_3 c_1)))
(let ((?v_191 (not ?v_209)) (?v_192 (p9 c_3 c_2)))
(let ((?v_226 (not ?v_192)) (?v_210 (p7 c_3 c_2)))
(let ((?v_193 (not ?v_210)) (?v_194 (p9 c_3 c_3)))
(let ((?v_227 (not ?v_194)) (?v_211 (p7 c_3 c_3)))
(let ((?v_195 (not ?v_211)))

(and
 (distinct c_0 c_1 c_2 c_3)
 (p4 c14 c12)
 (p4 c14 c13)
 (or ?v_16 ?v_32)
 (or ?v_17 ?v_33)
 (or ?v_18 ?v_34)
 (or ?v_19 ?v_35)
 (or ?v_20 ?v_36)
 (or ?v_21 ?v_37)
 (or ?v_22 ?v_38)
 (or ?v_23 ?v_39)
 (or ?v_24 ?v_40)
 (or ?v_25 ?v_41)
 (or ?v_26 ?v_42)
 (or ?v_27 ?v_43)
 (or ?v_28 ?v_44)
 (or ?v_29 ?v_45)
 (or ?v_30 ?v_46)
 (or ?v_31 ?v_47)
 (or ?v_0 ?v_0)
 (or ?v_2 ?v_1)
 (or ?v_5 ?v_4)
 (or ?v_10 ?v_9)
 (or ?v_1 ?v_2)
 (or ?v_3 ?v_3)
 (or ?v_7 ?v_6)
 (or ?v_12 ?v_11)
 (or ?v_4 ?v_5)
 (or ?v_6 ?v_7)
 (or ?v_8 ?v_8)
 (or ?v_14 ?v_13)
 (or ?v_9 ?v_10)
 (or ?v_11 ?v_12)
 (or ?v_13 ?v_14)
 (or ?v_15 ?v_15)
 (not (p6 c15 c17))
 (or ?v_0 ?v_54)
 (or ?v_2 ?v_66)
 (or ?v_5 ?v_78)
 (or ?v_10 ?v_90)
 (or ?v_1 ?v_57)
 (or ?v_3 ?v_69)
 (or ?v_7 ?v_81)
 (or ?v_12 ?v_93)
 (or ?v_4 ?v_60)
 (or ?v_6 ?v_72)
 (or ?v_8 ?v_84)
 (or ?v_14 ?v_96)
 (or ?v_9 ?v_63)
 (or ?v_11 ?v_75)
 (or ?v_13 ?v_87)
 (or ?v_15 ?v_99)
 (or ?v_100 ?v_16)
 (or ?v_101 ?v_17)
 (or ?v_102 ?v_18)
 (or ?v_103 ?v_19)
 (or ?v_104 ?v_20)
 (or ?v_105 ?v_21)
 (or ?v_106 ?v_22)
 (or ?v_107 ?v_23)
 (or ?v_108 ?v_24)
 (or ?v_109 ?v_25)
 (or ?v_110 ?v_26)
 (or ?v_111 ?v_27)
 (or ?v_112 ?v_28)
 (or ?v_113 ?v_29)
 (or ?v_114 ?v_30)
 (or ?v_115 ?v_31)
 (p4 c13 c11)
 (or ?v_0 ?v_32)
 (or ?v_2 ?v_33)
 (or ?v_5 ?v_34)
 (or ?v_10 ?v_35)
 (or ?v_1 ?v_36)
 (or ?v_3 ?v_37)
 (or ?v_7 ?v_38)
 (or ?v_12 ?v_39)
 (or ?v_4 ?v_40)
 (or ?v_6 ?v_41)
 (or ?v_8 ?v_42)
 (or ?v_14 ?v_43)
 (or ?v_9 ?v_44)
 (or ?v_11 ?v_45)
 (or ?v_13 ?v_46)
 (or ?v_15 ?v_47)
 (or (= ?v_117 c10) ?v_48 (not ?v_116))
 (or (= ?v_119 c10) ?v_48 (not ?v_118))
 (or (= ?v_121 c10) ?v_48 (not ?v_120))
 (or (= ?v_123 c10) ?v_48 (not ?v_122))
 (or (= ?v_125 c10) ?v_49 (not ?v_124))
 (or (= ?v_127 c10) ?v_49 (not ?v_126))
 (or (= ?v_129 c10) ?v_49 (not ?v_128))
 (or (= ?v_131 c10) ?v_49 (not ?v_130))
 (or (= ?v_133 c10) ?v_50 (not ?v_132))
 (or (= ?v_135 c10) ?v_50 (not ?v_134))
 (or (= ?v_137 c10) ?v_50 (not ?v_136))
 (or (= ?v_139 c10) ?v_50 (not ?v_138))
 (or (= ?v_141 c10) ?v_51 (not ?v_140))
 (or (= ?v_143 c10) ?v_51 (not ?v_142))
 (or (= ?v_145 c10) ?v_51 (not ?v_144))
 (or (= ?v_147 c10) ?v_51 (not ?v_146))
 (p6 c15 c16)
 (p8 c15)
 (not (p4 (f5 c15 c17) (f5 c15 c16)))
 (or ?v_52 ?v_53 ?v_54)
 (or ?v_55 ?v_56 ?v_57)
 (or ?v_58 ?v_59 ?v_60)
 (or ?v_61 ?v_62 ?v_63)
 (or ?v_64 ?v_65 ?v_66)
 (or ?v_67 ?v_68 ?v_69)
 (or ?v_70 ?v_71 ?v_72)
 (or ?v_73 ?v_74 ?v_75)
 (or ?v_76 ?v_77 ?v_78)
 (or ?v_79 ?v_80 ?v_81)
 (or ?v_82 ?v_83 ?v_84)
 (or ?v_85 ?v_86 ?v_87)
 (or ?v_88 ?v_89 ?v_90)
 (or ?v_91 ?v_92 ?v_93)
 (or ?v_94 ?v_95 ?v_96)
 (or ?v_97 ?v_98 ?v_99)
 (p4 c12 c11)
 (or ?v_52 (not ?v_100) ?v_54)
 (or ?v_55 (not ?v_101) ?v_57)
 (or ?v_58 (not ?v_102) ?v_60)
 (or ?v_61 (not ?v_103) ?v_63)
 (or ?v_64 (not ?v_104) ?v_66)
 (or ?v_67 (not ?v_105) ?v_69)
 (or ?v_70 (not ?v_106) ?v_72)
 (or ?v_73 (not ?v_107) ?v_75)
 (or ?v_76 (not ?v_108) ?v_78)
 (or ?v_79 (not ?v_109) ?v_81)
 (or ?v_82 (not ?v_110) ?v_84)
 (or ?v_85 (not ?v_111) ?v_87)
 (or ?v_88 (not ?v_112) ?v_90)
 (or ?v_91 (not ?v_113) ?v_93)
 (or ?v_94 (not ?v_114) ?v_96)
 (or ?v_97 (not ?v_115) ?v_99)
 (or ?v_53 ?v_148)
 (or ?v_56 ?v_152)
 (or ?v_59 ?v_156)
 (or ?v_62 ?v_160)
 (or ?v_65 ?v_149)
 (or ?v_68 ?v_153)
 (or ?v_71 ?v_157)
 (or ?v_74 ?v_161)
 (or ?v_77 ?v_150)
 (or ?v_80 ?v_154)
 (or ?v_83 ?v_158)
 (or ?v_86 ?v_162)
 (or ?v_89 ?v_151)
 (or ?v_92 ?v_155)
 (or ?v_95 ?v_159)
 (or ?v_98 ?v_163)
 (or ?v_52 ?v_53 (not ?v_32))
 (or ?v_55 ?v_56 (not ?v_33))
 (or ?v_58 ?v_59 (not ?v_34))
 (or ?v_61 ?v_62 (not ?v_35))
 (or ?v_64 ?v_65 (not ?v_36))
 (or ?v_67 ?v_68 (not ?v_37))
 (or ?v_70 ?v_71 (not ?v_38))
 (or ?v_73 ?v_74 (not ?v_39))
 (or ?v_76 ?v_77 (not ?v_40))
 (or ?v_79 ?v_80 (not ?v_41))
 (or ?v_82 ?v_83 (not ?v_42))
 (or ?v_85 ?v_86 (not ?v_43))
 (or ?v_88 ?v_89 (not ?v_44))
 (or ?v_91 ?v_92 (not ?v_45))
 (or ?v_94 ?v_95 (not ?v_46))
 (or ?v_97 ?v_98 (not ?v_47))
 (p4 c11 c10)
 (or ?v_0 ?v_53 ?v_0)
 (or ?v_0 ?v_56 ?v_2)
 (or ?v_0 ?v_59 ?v_5)
 (or ?v_0 ?v_62 ?v_10)
 (or ?v_2 ?v_53 ?v_1)
 (or ?v_2 ?v_56 ?v_3)
 (or ?v_2 ?v_59 ?v_7)
 (or ?v_2 ?v_62 ?v_12)
 (or ?v_5 ?v_53 ?v_4)
 (or ?v_5 ?v_56 ?v_6)
 (or ?v_5 ?v_59 ?v_8)
 (or ?v_5 ?v_62 ?v_14)
 (or ?v_10 ?v_53 ?v_9)
 (or ?v_10 ?v_56 ?v_11)
 (or ?v_10 ?v_59 ?v_13)
 (or ?v_10 ?v_62 ?v_15)
 (or ?v_1 ?v_65 ?v_0)
 (or ?v_1 ?v_68 ?v_2)
 (or ?v_1 ?v_71 ?v_5)
 (or ?v_1 ?v_74 ?v_10)
 (or ?v_3 ?v_65 ?v_1)
 (or ?v_3 ?v_68 ?v_3)
 (or ?v_3 ?v_71 ?v_7)
 (or ?v_3 ?v_74 ?v_12)
 (or ?v_7 ?v_65 ?v_4)
 (or ?v_7 ?v_68 ?v_6)
 (or ?v_7 ?v_71 ?v_8)
 (or ?v_7 ?v_74 ?v_14)
 (or ?v_12 ?v_65 ?v_9)
 (or ?v_12 ?v_68 ?v_11)
 (or ?v_12 ?v_71 ?v_13)
 (or ?v_12 ?v_74 ?v_15)
 (or ?v_4 ?v_77 ?v_0)
 (or ?v_4 ?v_80 ?v_2)
 (or ?v_4 ?v_83 ?v_5)
 (or ?v_4 ?v_86 ?v_10)
 (or ?v_6 ?v_77 ?v_1)
 (or ?v_6 ?v_80 ?v_3)
 (or ?v_6 ?v_83 ?v_7)
 (or ?v_6 ?v_86 ?v_12)
 (or ?v_8 ?v_77 ?v_4)
 (or ?v_8 ?v_80 ?v_6)
 (or ?v_8 ?v_83 ?v_8)
 (or ?v_8 ?v_86 ?v_14)
 (or ?v_14 ?v_77 ?v_9)
 (or ?v_14 ?v_80 ?v_11)
 (or ?v_14 ?v_83 ?v_13)
 (or ?v_14 ?v_86 ?v_15)
 (or ?v_9 ?v_89 ?v_0)
 (or ?v_9 ?v_92 ?v_2)
 (or ?v_9 ?v_95 ?v_5)
 (or ?v_9 ?v_98 ?v_10)
 (or ?v_11 ?v_89 ?v_1)
 (or ?v_11 ?v_92 ?v_3)
 (or ?v_11 ?v_95 ?v_7)
 (or ?v_11 ?v_98 ?v_12)
 (or ?v_13 ?v_89 ?v_4)
 (or ?v_13 ?v_92 ?v_6)
 (or ?v_13 ?v_95 ?v_8)
 (or ?v_13 ?v_98 ?v_14)
 (or ?v_15 ?v_89 ?v_9)
 (or ?v_15 ?v_92 ?v_11)
 (or ?v_15 ?v_95 ?v_13)
 (or ?v_15 ?v_98 ?v_15)
 (or ?v_212 ?v_116 ?v_48 ?v_165 (= ?v_117 c11))
 (or ?v_213 ?v_118 ?v_48 ?v_167 (= ?v_119 c11))
 (or ?v_214 ?v_120 ?v_48 ?v_169 (= ?v_121 c11))
 (or ?v_215 ?v_122 ?v_48 ?v_171 (= ?v_123 c11))
 (or ?v_216 ?v_124 ?v_49 ?v_173 (= ?v_125 c11))
 (or ?v_217 ?v_126 ?v_49 ?v_175 (= ?v_127 c11))
 (or ?v_218 ?v_128 ?v_49 ?v_177 (= ?v_129 c11))
 (or ?v_219 ?v_130 ?v_49 ?v_179 (= ?v_131 c11))
 (or ?v_220 ?v_132 ?v_50 ?v_181 (= ?v_133 c11))
 (or ?v_221 ?v_134 ?v_50 ?v_183 (= ?v_135 c11))
 (or ?v_222 ?v_136 ?v_50 ?v_185 (= ?v_137 c11))
 (or ?v_223 ?v_138 ?v_50 ?v_187 (= ?v_139 c11))
 (or ?v_224 ?v_140 ?v_51 ?v_189 (= ?v_141 c11))
 (or ?v_225 ?v_142 ?v_51 ?v_191 (= ?v_143 c11))
 (or ?v_226 ?v_144 ?v_51 ?v_193 (= ?v_145 c11))
 (or ?v_227 ?v_146 ?v_51 ?v_195 (= ?v_147 c11))
 (or ?v_148 ?v_100)
 (or ?v_149 ?v_101)
 (or ?v_150 ?v_102)
 (or ?v_151 ?v_103)
 (or ?v_152 ?v_104)
 (or ?v_153 ?v_105)
 (or ?v_154 ?v_106)
 (or ?v_155 ?v_107)
 (or ?v_156 ?v_108)
 (or ?v_157 ?v_109)
 (or ?v_158 ?v_110)
 (or ?v_159 ?v_111)
 (or ?v_160 ?v_112)
 (or ?v_161 ?v_113)
 (or ?v_162 ?v_114)
 (or ?v_163 ?v_115)
 (or ?v_116 (= ?v_117 c13) ?v_164 ?v_48 ?v_165)
 (or ?v_118 (= ?v_119 c13) ?v_166 ?v_48 ?v_167)
 (or ?v_120 (= ?v_121 c13) ?v_168 ?v_48 ?v_169)
 (or ?v_122 (= ?v_123 c13) ?v_170 ?v_48 ?v_171)
 (or ?v_124 (= ?v_125 c13) ?v_172 ?v_49 ?v_173)
 (or ?v_126 (= ?v_127 c13) ?v_174 ?v_49 ?v_175)
 (or ?v_128 (= ?v_129 c13) ?v_176 ?v_49 ?v_177)
 (or ?v_130 (= ?v_131 c13) ?v_178 ?v_49 ?v_179)
 (or ?v_132 (= ?v_133 c13) ?v_180 ?v_50 ?v_181)
 (or ?v_134 (= ?v_135 c13) ?v_182 ?v_50 ?v_183)
 (or ?v_136 (= ?v_137 c13) ?v_184 ?v_50 ?v_185)
 (or ?v_138 (= ?v_139 c13) ?v_186 ?v_50 ?v_187)
 (or ?v_140 (= ?v_141 c13) ?v_188 ?v_51 ?v_189)
 (or ?v_142 (= ?v_143 c13) ?v_190 ?v_51 ?v_191)
 (or ?v_144 (= ?v_145 c13) ?v_192 ?v_51 ?v_193)
 (or ?v_146 (= ?v_147 c13) ?v_194 ?v_51 ?v_195)
 (or (= ?v_117 c14) ?v_196 ?v_116 ?v_48 ?v_164)
 (or (= ?v_119 c14) ?v_197 ?v_118 ?v_48 ?v_166)
 (or (= ?v_121 c14) ?v_198 ?v_120 ?v_48 ?v_168)
 (or (= ?v_123 c14) ?v_199 ?v_122 ?v_48 ?v_170)
 (or (= ?v_125 c14) ?v_200 ?v_124 ?v_49 ?v_172)
 (or (= ?v_127 c14) ?v_201 ?v_126 ?v_49 ?v_174)
 (or (= ?v_129 c14) ?v_202 ?v_128 ?v_49 ?v_176)
 (or (= ?v_131 c14) ?v_203 ?v_130 ?v_49 ?v_178)
 (or (= ?v_133 c14) ?v_204 ?v_132 ?v_50 ?v_180)
 (or (= ?v_135 c14) ?v_205 ?v_134 ?v_50 ?v_182)
 (or (= ?v_137 c14) ?v_206 ?v_136 ?v_50 ?v_184)
 (or (= ?v_139 c14) ?v_207 ?v_138 ?v_50 ?v_186)
 (or (= ?v_141 c14) ?v_208 ?v_140 ?v_51 ?v_188)
 (or (= ?v_143 c14) ?v_209 ?v_142 ?v_51 ?v_190)
 (or (= ?v_145 c14) ?v_210 ?v_144 ?v_51 ?v_192)
 (or (= ?v_147 c14) ?v_211 ?v_146 ?v_51 ?v_194)
 (or ?v_116 ?v_212 ?v_196 (= ?v_117 c12) ?v_48)
 (or ?v_118 ?v_213 ?v_197 (= ?v_119 c12) ?v_48)
 (or ?v_120 ?v_214 ?v_198 (= ?v_121 c12) ?v_48)
 (or ?v_122 ?v_215 ?v_199 (= ?v_123 c12) ?v_48)
 (or ?v_124 ?v_216 ?v_200 (= ?v_125 c12) ?v_49)
 (or ?v_126 ?v_217 ?v_201 (= ?v_127 c12) ?v_49)
 (or ?v_128 ?v_218 ?v_202 (= ?v_129 c12) ?v_49)
 (or ?v_130 ?v_219 ?v_203 (= ?v_131 c12) ?v_49)
 (or ?v_132 ?v_220 ?v_204 (= ?v_133 c12) ?v_50)
 (or ?v_134 ?v_221 ?v_205 (= ?v_135 c12) ?v_50)
 (or ?v_136 ?v_222 ?v_206 (= ?v_137 c12) ?v_50)
 (or ?v_138 ?v_223 ?v_207 (= ?v_139 c12) ?v_50)
 (or ?v_140 ?v_224 ?v_208 (= ?v_141 c12) ?v_51)
 (or ?v_142 ?v_225 ?v_209 (= ?v_143 c12) ?v_51)
 (or ?v_144 ?v_226 ?v_210 (= ?v_145 c12) ?v_51)
 (or ?v_146 ?v_227 ?v_211 (= ?v_147 c12) ?v_51)
 (or (= ?v_117 c_0) (= ?v_117 c_1) (= ?v_117 c_2) (= ?v_117 c_3))
 (or (= ?v_119 c_0) (= ?v_119 c_1) (= ?v_119 c_2) (= ?v_119 c_3))
 (or (= ?v_121 c_0) (= ?v_121 c_1) (= ?v_121 c_2) (= ?v_121 c_3))
 (or (= ?v_123 c_0) (= ?v_123 c_1) (= ?v_123 c_2) (= ?v_123 c_3))
 (or (= ?v_125 c_0) (= ?v_125 c_1) (= ?v_125 c_2) (= ?v_125 c_3))
 (or (= ?v_127 c_0) (= ?v_127 c_1) (= ?v_127 c_2) (= ?v_127 c_3))
 (or (= ?v_129 c_0) (= ?v_129 c_1) (= ?v_129 c_2) (= ?v_129 c_3))
 (or (= ?v_131 c_0) (= ?v_131 c_1) (= ?v_131 c_2) (= ?v_131 c_3))
 (or (= ?v_133 c_0) (= ?v_133 c_1) (= ?v_133 c_2) (= ?v_133 c_3))
 (or (= ?v_135 c_0) (= ?v_135 c_1) (= ?v_135 c_2) (= ?v_135 c_3))
 (or (= ?v_137 c_0) (= ?v_137 c_1) (= ?v_137 c_2) (= ?v_137 c_3))
 (or (= ?v_139 c_0) (= ?v_139 c_1) (= ?v_139 c_2) (= ?v_139 c_3))
 (or (= ?v_141 c_0) (= ?v_141 c_1) (= ?v_141 c_2) (= ?v_141 c_3))
 (or (= ?v_143 c_0) (= ?v_143 c_1) (= ?v_143 c_2) (= ?v_143 c_3))
 (or (= ?v_145 c_0) (= ?v_145 c_1) (= ?v_145 c_2) (= ?v_145 c_3))
 (or (= ?v_147 c_0) (= ?v_147 c_1) (= ?v_147 c_2) (= ?v_147 c_3))
 (or (= c14 c_0) (= c14 c_1) (= c14 c_2) (= c14 c_3))
 (or (= c12 c_0) (= c12 c_1) (= c12 c_2) (= c12 c_3))
 (or (= c13 c_0) (= c13 c_1) (= c13 c_2) (= c13 c_3))
 (or (= c15 c_0) (= c15 c_1) (= c15 c_2) (= c15 c_3))
 (or (= c17 c_0) (= c17 c_1) (= c17 c_2) (= c17 c_3))
 (or (= c11 c_0) (= c11 c_1) (= c11 c_2) (= c11 c_3))
 (or (= c10 c_0) (= c10 c_1) (= c10 c_2) (= c10 c_3))
 (or (= c16 c_0) (= c16 c_1) (= c16 c_2) (= c16 c_3))
)

)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)