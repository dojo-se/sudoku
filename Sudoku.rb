# encoding: utf-8

# Esqueleto de código Ruby para uso no Dojo-SE
# Escrito por Breno Augusto Santana Moura <basmoura@gmail.com>.
# 
# Para executar os testes, chame o interpretador Ruby com esse arquivo como
# parâmetro. Ex: ruby <caminho_do_arquivo>.rb

require 'minitest/autorun'

class ProblemaParaResolverTest < Minitest::Test
	def test_quando_a_matriz_for_vazia
		mSudokuVazio = [[0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],		
									 [0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],		
									 [0,0,0,0,0,0,0,0,0],	
									 [0,0,0,0,0,0,0,0,0],
						  		 [0,0,0,0,0,0,0,0,0]]
		
		assert_equal(true, ProblemaParaResolver.problema(mSudokuVazio))
  end
	
	def test_dois_1_na_horizontal
 		mSudokuDoisUnsHorizontal = [[0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],		
									 [0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],		
									 [0,0,0,1,0,1,0,0,0],	
									 [0,0,0,0,0,0,0,0,0],
						  		 [0,0,0,0,0,0,0,0,0]]
		
		assert_equal(false, ProblemaParaResolver.problema(mSudokuDoisUnsHorizontal))
	end
	
	def test_quando_houver_uma_linha_horizontal_corretamente_preenchida
				mSudokuHorizontalCerto = [
									 [0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],
									 [1,2,3,4,5,6,7,8,9],
									 [0,0,0,0,0,0,0,0,0],		
									 [0,0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0,0],		
									 [0,0,0,0,0,0,0,0,0],	
									 [0,0,0,0,0,0,0,0,0],
						  		 [0,0,0,0,0,0,0,0,0]
					]
		assert_equal(true, ProblemaParaResolver.problema(mSudokuHorizontalCerto))
	end
end

class ProblemaParaResolver
  def self.problema(mSudoku)
		prev = mSudoku[0][0]
		#i = 1
		9.times do |i|
			(9-i).times do |idx|
				return false if prev == mSudoku[idx][0]
				prev = mSudoku[i][0]
				#i += 1
			end
		end
		
# 		mSudoku.map do |k, linha|
# 			linhaTemp=linha.sort
# 			celulaAnterior = 0
# 			linhaTemp.map do |celula|
# 				if celulaAnterior == celula and celula != 0
# 					return false
# 				else
# 					celulaAnterior = celula
# 				end
# 			end
# 		end
		
#     true
  end
end