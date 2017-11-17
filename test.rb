# We want to separate items in a set into partitions.
#
# We want to balance out the attributes of the items, such that the distribution
# of attributes in each partition mirrors that of the entire set.
#
# To do this, we calculate a "balance score" for each partition, and average them
# get a balance score for all the partitions.
#
# Given an unassigned item and a list of partitions, we try putting them 
# This finds the optimal partition to put that item in to maintai n balance.


class Team
  def initialize(name, directors)
end

class Dancer
  def initialize(name, gender, year)
    @name = name
    @gender = gender
    @year = year
  end
  # team
  # gender
  # year
  # been on AFX?
end


# def balanceCalculation(listOfAttributes1, listOfAttributes2)
# #   for each
# #   map()
#     euclidean_distance(listOfAttributes1, listOfAttributes2)
# end


# def euclidean_distance(p1,p2)
#   sum_of_squares = 0
#   p1.each_with_index do |p1_coord,index| 
#     sum_of_squares += (p1_coord - p2[index]) ** 2 
#   end
#   Math.sqrt( sum_of_squares )
# end


#calculate balance score for a team/partition
def partitionBalanceScore(partition)
  allPartitionsRatio
  partitionRatio
  attributes
  perAttributeBalanceScores = attributes.map do | attribute |
    attribute[:method]
    return attribute[:weight] * 
  end
  perAttributeBalanceScores
end

class AttributesBuilder
  def initialize()
    @attributes = []
  end
  
  def attributes
    return @attributes
  end
  
  def add_attribute(method, weight)
    @attributes.push({method: method, weight: weight})
    return self
  end
end

a = AttributesBuilder
a.add_attribute(&:gender, 0.5)
a.add_attribute(&:year, 0.5)
attributes = AttributesBuilder.attributes

attributes = [
    {
        method: &:gender,
        weight: 0.5,
    },
    {
        method: &:year,
        weight: 0.5,
    }
]








totalRatio = {
  gender:
    male: 0.5
    female: 0.5
  year:
    1: 0.25
    2: 0.25
    3: 0.25
    4: 0.25
}

partitionRatio = [
  {
    gender:
      male: 0.5
      female: 0.5
    year:
      1: 0.25
      2: 0.25
      3: 0.25
      4: 0.25
  },
  {
    gender:
      male: 0.5
      female: 0.5
    year
      1: 0.25
      2: 0.25
      3: 0.25
      4: 0.25
  }
]

#Org = total list of dancers, balance score
#Team = team_size, ratio of gender, ratio of years, ratio of other attributes
#Dancer = gender, year, etc.

# Example:
# takes in: 
#   attribute: {method: &:gender, weight: 0.5}
#   partition: [Dancer<gender: 'male'>, Dancer<gender: 'female'>]
# returns: {'male': 0.5, 'female': 0.5}
def get_attribute_ratios(attribute, partition)
  result = {}
  for item in partition
    value = attribute[:method](item)
    result[value] += (1 / partition.length)
  end
  return result
end

def get_team_ratio(attribute_ratio)
  
end

class Balancer
  def initialize()
    @partitions
    @attributes
    @totalRatio
  end
  
  def balance_score()
    @partitions.map { |partition| balance_score_per_partition(partition) }.sum()
  end
  
  def balance_score_per_partition(partition)
    @attributes.map { |attribute| balance_score_per_attribute(partition, attribute) }.sum() ** 2
  end
  
  def balance_score_per_attribute(partition, attribute)
    values = @totalRatio[attribute].keys  # example: values == ['male', 'female']
    attribute.weight * sqrt(values.map { |value| balance_score_per_value(partition, attribute, value) }.sum())
  end
  
  def balance_score_per_value(partition, attribute, value)
    # squared difference of team and org
    (partitionRatio[attribute][value] - totalRatio[attribute][value]) ** 2
  end
end




# # attributes[0][:method](item) => item.gender
# # attributes is a dictionary of lists {gender:[male, female], year:[freshman, sophomore, junior, senior] }
# def totalBalanceScore(partitions, attributes)
#   # average of all the partition balance scores
#   # returns sum of squares of each partition
#   balanceScore = 0
#   for partition in partitions
#     for attribute in attributes
#       values = totalRatio[attribute].keys  # example: values == ['male', 'female']
#       value_distance = 0
#       for value in values
#         value_distance += (partitionRatio[attribute][value] - totalRatio[attribute][value]) ** 2
#       end
#       balanceScore +=  (attribute.weight * sqrt(value_distance))**2
#     end
#   end
#   return balanceScore
# end



# given a item that needs to switch, what team/partition to switch to?
def optimalPartitionChoice(item, partitions)
    
    totaBalanceScores = {nameOfPartition: balanceScore}
    for each partiton in partitions
        add item to partition temporarily
        totaBalanceScores[partition] = totalBalanceScore(partitions)
        remove item from partition
    
    find min of totaBalanceScores and get partition
    return partition
    
end


def optimalPartitionChoice2(item, partitions)
    partitionToScore = {}
    partitions.each do |partition|
        # temporarily add dancer to partition
        partitionToScore[partition] = partitionBalanceScore(partition.insert(item))
    end
    # Goal: add dancer to partition that minimizes totalBalanceScore
    return smallest_hash_key(partitionToScore) # returns best partition
end



def smallest_hash_key(hash)
    hash.min_by{|k,v| v}
end
    